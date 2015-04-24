# Copyright 2011, Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package Google::Ads::Common::ReportUtils;

use strict;
use utf8;
use version;

use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::Reports::ReportingConfiguration;
use Google::Ads::AdWords::RequestStats;

# The following needs to be on one line because CPAN uses a particularly hacky
# eval() to determine module versions.
use Google::Ads::Common::Constants; our $VERSION = ${Google::Ads::Common::Constants::VERSION};

use Google::Ads::Common::ReportDownloadError;

use File::stat;
use HTTP::Request;
use HTTP::Status qw(:constants);
use Log::Log4perl qw(:levels);
use LWP::UserAgent;
use MIME::Base64;
use POSIX;
use Time::HiRes qw(gettimeofday tv_interval);
use URI::Escape;
use XML::Simple;

use constant ADHOC_REPORT_DOWNLOAD_URL => "%s/api/adwords/reportdownload/%s";
use constant LWP_DEFAULT_TIMEOUT => 300; # 5 minutes.
use constant SCRUBBED_HEADERS => qw(DeveloperToken Authorization);

sub download_report {
  my ($report_definition, $client, $file_path, $server,
      $return_money_in_micros, $timeout) = @_;

  # Build report downlad url.
  $server = $server ? $server : $client->get_alternate_url();
  $server = $server =~ /\/$/ ? substr($server, 0, -1) : $server;
  my $url;

  $url = sprintf(ADHOC_REPORT_DOWNLOAD_URL, $server, $client->get_version());

  my $lwp = LWP::UserAgent->new();

  # Setting HTTP user-agent and gzip compression.
  my $can_accept = HTTP::Message::decodable;
  my $gzip_support = $can_accept =~ /gzip/i;
  $lwp->default_header("Accept-Encoding" => scalar $can_accept);
  $lwp->agent($client->get_user_agent() . ($gzip_support ? " gzip" : ""));

  # Set agent timeout.
  $lwp->timeout($timeout ? $timeout : LWP_DEFAULT_TIMEOUT);

  # Set the authorization headers.
  my @headers = ();

  my $auth_handler = $client->_get_auth_handler();

  if ($auth_handler->isa("Google::Ads::Common::OAuth2BaseHandler")) {
    # In this case we use the client OAuth2
    push @headers, "Authorization" => "Bearer " .
        $auth_handler->get_access_token();
  } else {
    my $handler_warning = "The authorization handler is not supported.";
    if ($client->get_die_on_faults()) {
      die($handler_warning);
    } else {
      warn($handler_warning);
    }
  }

  my $current_version = $client->get_version();
  $current_version =~ s/[^0-9]//g;
  if ($client->get_client_id()) {
    push @headers, "clientCustomerId" => $client->get_client_id();
  }

  # Set other headers.
  if (defined $return_money_in_micros) {
    if ($client->get_die_on_faults()) {
      die("Version " . $client->get_version() .
          " does not support returnMoneyInMicros.");
    } else {
      warn("Version " . $client->get_version() .
           " does not support returnMoneyInMicros.");
    }
  }

  # Set reporting configuration headers.
  my $reporting_config = $client->get_reporting_config();
  if ($reporting_config and (defined $reporting_config->get_skip_header() or
        defined $reporting_config->get_skip_column_header() or
        defined $reporting_config->get_skip_summary())) {
    if (defined $reporting_config->get_skip_header()) {
        push @headers, "skipReportHeader" =>
            $reporting_config->get_skip_header() ?
                "true" : "false";
    }
    if (defined $reporting_config->get_skip_column_header()) {
        push @headers, "skipColumnHeader" =>
            $reporting_config->get_skip_column_header() ?
                "true" : "false";
    }
    if (defined $reporting_config->get_skip_summary()) {
        push @headers, "skipReportSummary" =>
            $reporting_config->get_skip_summary() ?
                "true" : "false";
    }
  }
  push @headers, "developerToken" => $client->get_developer_token();

  # Read proxy configuration for the enviroment.
  $lwp->env_proxy();

  # Request the report.
  my $request;
  my $format;
  if (ref($report_definition) eq "HASH") {
    push @headers, "Content-Type" => "application/x-www-form-urlencoded";
    $request = HTTP::Request->new("POST", $url, \@headers, "__rdquery=" .
        uri_escape_utf8($report_definition->{query}) . "&__fmt=" .
        uri_escape_utf8($report_definition->{format}));
    $format = $report_definition->{format};
  } else {
    push @headers, "Content-Type" => "application/x-www-form-urlencoded";
    $request = HTTP::Request->new("POST", $url, \@headers, "__rdxml=" .
        uri_escape_utf8("<reportDefinition>" . $report_definition .
                        "</reportDefinition>"));
    $format = $report_definition->get_downloadFormat() . "";
  }

  my $start_time = [gettimeofday()];
  my $response;
  if ($file_path) {
    ($file_path) = glob($file_path);
    if (!$gzip_support) {
      # If not gzip support then we can stream directly to a file.
      $response = $lwp->request($request, $file_path);
    } else {
      my $mode = ">:utf8";
      if ($format =~ /^GZIPPED|PDF/) {
        # Binary format can't dump as UTF8.
        $mode = ">";
      }
      open(FH, $mode, $file_path) or warn "Can't write to '$file_path': $!";
      $response = $lwp->request($request);
      # Need to decode in a file.
      print FH $response->decoded_content();
      close FH;
    }
  } else {
    $response = $lwp->request($request);
  }
  my $is_successful = 0;
  my $error_message;
  my $return_val;
  if ($response->code == HTTP_OK) {
    $is_successful = 1;
    if ($file_path) {
      open(FILE, "<", $file_path) or return undef;
      my $result = <FILE>;
      close(FILE);
      $return_val = stat($file_path)->size;
    } else {
      $return_val = $response->decoded_content();
    }
  } elsif ($response->code == HTTP_BAD_REQUEST) {
    my $result = $response->decoded_content();
    $return_val = __extract_xml_error($result);
    $error_message = $return_val;
  } else {
    $return_val = undef;
  }

  # Log request and response information before returning the result.
  __log_report_request_response(
    $client,
    $request,
    $response,
    $is_successful,
    $error_message,
    tv_interval($start_time)
  );

  return $return_val;
}

sub __extract_xml_error {
  my $ref = XML::Simple->new()->XMLin(shift, ForceContent => 1);

  return Google::Ads::Common::ReportDownloadError->new({
    type => $ref->{ApiError}->{type}->{content},
    field_path => $ref->{ApiError}->{fieldPath}->{content} ?
        $ref->{ApiError}->{fieldPath}->{content} : "",
    trigger => $ref->{ApiError}->{trigger}->{content} ?
        $ref->{ApiError}->{trigger}->{content} : ""
  });
}

sub __log_report_request_response {
  my ($client, $request, $response, $is_successful, $error_message,
    $elapsed_seconds) = @_;

  # Always log the request stats to the AdWordsAPI logger.
  my $auth_handler = $client->_get_auth_handler();

  my $request_stats = Google::Ads::AdWords::RequestStats->new({
    authentication =>
      !$auth_handler ? "" :
        $auth_handler->isa("Google::Ads::Common::OAuth2BaseHandler") ?
          "OAuth" : "Unknown",
    client_id => $client->get_client_id(),
    service_name => $request->uri,
    method_name => $request->method,
    is_fault => !$is_successful,
    response_time => int(($elapsed_seconds * 1000) + 0.5),
  });
  $client->_push_new_request_stats($request_stats);
  Google::Ads::AdWords::Logging::get_awapi_logger->info($request_stats);

  # Log the request.
  if ($request) {
    # Log the full request:
    #  To WARN if the request failed OR
    #  To INFO if the request succeeded
    my $request_string = $request->as_string("\n");
    # Remove sensitive information from the log message.
    foreach my $header (SCRUBBED_HEADERS) {
      $request_string =~
        s!(\n$header):(.*)\n!$1: REDACTED\n!;
    }
    my $log_message = sprintf("Outgoing %s report request:\n%s",
      $is_successful ? 'successful' : 'failed',
      $request_string
    );
    Google::Ads::AdWords::Logging::get_soap_logger->log(
      $is_successful ? $INFO : $WARN,
      $log_message
    );
  }

  # Log the response.
  if ($response) {
    # Log:
    #  To WARN if the request failed OR
    #  To INFO (status and message only)
    my $log_message = sprintf(
      "Incoming %s report response with status code %s and message '%s'",
      $is_successful ? 'successful' : 'failed',
      $response->code,
      $response->message
    );

    if ($is_successful) {
      Google::Ads::AdWords::Logging::get_soap_logger->info($log_message);
    } else {
      if (ref $error_message eq "Google::Ads::Common::ReportDownloadError") {
        $log_message = $log_message . sprintf(
          ": An error has occurred of type '%s', triggered by '%s'",
          $error_message->get_type(), $error_message->get_trigger()
        );
      } elsif ($error_message) {
        $log_message = $log_message . ': ' . $error_message;
      }
      Google::Ads::AdWords::Logging::get_soap_logger->logwarn($log_message);
    }
  }
}

return 1;

=pod

=head1 NAME

Google::Ads::Common::ReportUtils

=head1 SYNOPSIS

 use Google::Ads::Common::ReportUtils;

 Google::Ads::Common::ReportUtils::download_report($report_definition,
                                                   $client, $path);

=head1 DESCRIPTION

Google::Ads::Common::ReportUtils a collection of utility methods for working
with reports.

=head1 SUBROUTINES

=head2 download_report

Downloads a new instance of an existing report definition. If the file_path
parameter is specified it will be downloaded to the file at that path, otherwise
it will be downloaded to memory and be returned as a string.

=head3 Parameters

=over

=item *

The report_definition parameter is either:
  - the id of a pre-defined report to download
  - a C<ReportDefinition> object to be defined and download on the fly
  - a hash with an AWQL query and format. i.e. { query => 'query',
    format => 'format' }

In the case of a plain id then the regular download endpoint will be used to
download a pre-stored definition, otherwise the versioned download url endpoint
(based on the version of the given C<Client> object) will be used.

=item *

The client parameter is an instance of a valid L<Google::AdWords::Client>.

=item *

The file_path is an optional parameter that if given the subroutine will write
out the report to the given file path.

=item *

The server is an optional parameter that can be set to alter the URL from where
the report will be requested.

=item *

The return_money_in_micros is a deprecated parameter. This parameter is no
longer supported.

=item *

The timeout is an optional parameter that can be set to alter the default
time that the http client waits to get a response from the server. If not set,
the default timeout used is
L<Google::Ads::Common::ReportUtils::LWP_DEFAULT_TIMEOUT>.

=back

=head3 Returns

If a file_path is given, the report gets saved to file and the file size is
returned, if not the report data itself is returned.

=head3 Exceptions

Starting with v201209 of the API a L<Google::Ads::Common::ReportDownloadError>
object will be returned in case of a download error. If not passing a
C<file_path> to dump the report then you must check if the return
isa("Google::Ads::Common::ReportDownloadError").

Prior to v201209 a warn() will be issued if a report download error occurs.

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Google Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=head1 AUTHOR

David Torres E<lt>api.davidtorres at gmail.comE<gt>

=head1 REPOSITORY INFORMATION

 $Rev: $
 $LastChangedBy: $
 $Id: $

=cut
