#!/usr/bin/perl -w
#
# Copyright 2012, Google Inc. All Rights Reserved.
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
#
# This example gets various statistics for a campaign during the last week. To
# get campaigns, run get_campaigns.pl.
#
# Tags: CampaignService.get
# Author: David Torres <api.davidtorres@gmail.com>

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201306::DateRange;
use Google::Ads::AdWords::v201306::OrderBy;
use Google::Ads::AdWords::v201306::Paging;
use Google::Ads::AdWords::v201306::Predicate;
use Google::Ads::AdWords::v201306::Selector;

use constant PAGE_SIZE => 500;

use Cwd qw(abs_path);

# Example main subroutine.
sub get_campaign_stats {
  my $client = shift;

  # Create selector.
  my $paging = Google::Ads::AdWords::v201306::Paging->new({
    startIndex => 0,
    numberResults => PAGE_SIZE
  });
  my (undef, undef, undef, $mday, $mon, $year) =
      localtime(time - 60 * 60 * 24 * 7);
  my $last_week = sprintf("%d%02d%02d", ($year + 1900), ($mon + 1), $mday);
  (undef, undef, undef, $mday, $mon, $year) = localtime(time - 60 * 60 * 24);
  my $yesterday = sprintf("%d%02d%02d", ($year + 1900), ($mon + 1), $mday);
  my $selector = Google::Ads::AdWords::v201306::Selector->new({
    fields => ["Id", "Name", "Impressions", "Clicks", "Cost", "Ctr"],
    predicates => [Google::Ads::AdWords::v201306::Predicate->new({
      field => "Impressions",
      operator => "GREATER_THAN",
      values => ["0"]
    })],
    dateRange => Google::Ads::AdWords::v201306::DateRange->new({
      # One week ago.
      min => $last_week,
      # One day ago.
      max => $yesterday
    }),
    paging => $paging
  });

  # Paginate through results.
  my $page;
  do {
    # Get campaigns and stats.
    $page = $client->CampaignService()->get({serviceSelector => $selector});

    # Display results.
    if ($page->get_entries()) {
      foreach my $campaign (@{$page->get_entries()}) {
        printf "Campaign with id \"%s\" and name \"%s\" has the following " .
               "stats during the last week:\n",
               $campaign->get_id(), $campaign->get_name();
        printf "  Impressions: %d.\n",
               $campaign->get_campaignStats()->get_impressions();
        printf "  Clicks: %d.\n",
               $campaign->get_campaignStats()->get_clicks();
        printf "  Cost: \$%.2f.\n",
               $campaign->get_campaignStats()->get_cost()->get_microAmount() /
               Google::Ads::AdWords::Constants::MICROS_PER_DOLLAR;
        printf "  CTR: %.2f%%.\n",
               $campaign->get_campaignStats()->get_ctr() * 100;
      }
    }
    $paging->set_startIndex($paging->get_startIndex() + PAGE_SIZE);
  } while ($paging->get_startIndex() < $page->get_totalNumEntries());

  return 1;
}

# Don't run the example if the file is being included.
if (abs_path($0) ne abs_path(__FILE__)) {
  return 1;
}

# Log SOAP XML request, response and API errors.
Google::Ads::AdWords::Logging::enable_all_logging();

# Get AdWords Client, credentials will be read from ~/adwords.properties.
my $client = Google::Ads::AdWords::Client->new({version => "v201306"});

# By default examples are set to die on any server returned fault.
$client->set_die_on_faults(1);

# Call the example
get_campaign_stats($client);
