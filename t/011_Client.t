#!/usr/bin/perl
#
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
#
# Unit (not functional) tests for the Google::Ads::AdWords::Client module.
# Functional tests of the various AdWords API services will be performed in a
# separate test.
#
# Author: David Torres <api.davidtorres@gmail.com>

use strict;

use File::Basename;
use File::Spec;
use Test::More (tests => 12);

# Set up @INC at runtime with an absolute path.
my $lib_path = File::Spec->catdir(dirname($0), "..", "lib");
push(@INC, $lib_path);

# Testing is ok to use the Client class
use_ok("Google::Ads::AdWords::Client")
    or die "Cannot load 'Google::Ads::AdWords::Client'";

# Test client initialization, including reading from properties files.
my $properties_file =
    File::Spec->catdir(dirname($0), qw(testdata client.test.input));
my $client_id = "client_id_override";
my $client = Google::Ads::AdWords::Client->new({
  client_id => $client_id,
  properties_file => $properties_file,
});
is($client->get_client_id(), $client_id);
is($client->get_user_agent(), "perl-unit-tests");
is($client->get_developer_token(), "dev-token",
    "Read of developer token");
is($client->get_oauth_2_handler()->get_refresh_token(), "refresh-token",
    "Read of refresh token");
is($client->get_alternate_url(), "https://adwords.google.com",
    "Read of alternate url");

# Test basic get/set methods.
$client->set_die_on_faults(1);
is($client->get_die_on_faults(), 1, "get/set die_on_faults()");

# Make sure this supports all the services we think it should for each version.
$client->set_version("v201406");
my @services = qw(AdGroupAdService
               AdGroupBidModifierService
               AdGroupCriterionService
               AdGroupFeedService
               AdGroupService
               AdParamService
               AdwordsUserListService
               AlertService
               BiddingStrategyService
               BudgetOrderService
               BudgetService
               CampaignAdExtensionService
               CampaignCriterionService
               CampaignFeedService
               CampaignService
               CampaignSharedSetService
               ConstantDataService
               ConversionTrackerService
               CustomerService
               CustomerSyncService
               DataService
               ExperimentService
               FeedItemService
               FeedMappingService
               FeedService
               GeoLocationService
               LabelService
               LocationCriterionService
               ManagedCustomerService
               MediaService
               MutateJobService
               OfflineConversionFeedService
               ReportDefinitionService
               SharedCriterionService
               SharedSetService
               TargetingIdeaService
               TrafficEstimatorService);
can_ok($client, @services);

ok(Google::Ads::AdWords::Client->new && Google::Ads::AdWords::Client->new,
   "Can construct more than one client object.");

# Test set auth properties.
my $test_oauth2_refresh_token = "my_oauth2_refresh_token";
$client->get_oauth_2_handler()->set_refresh_token($test_oauth2_refresh_token);
is($client->get_oauth_2_handler()->get_refresh_token(), $test_oauth2_refresh_token);

my $test_oauth2_client_secret = "my_client_secret";
$client->get_oauth_2_handler()->set_client_secret($test_oauth2_client_secret);
is($client->get_oauth_2_handler()->get_client_secret(), $test_oauth2_client_secret);

my $test_oauth2_client_id = "my_oauth2_client_id";
$client->get_oauth_2_handler()->set_client_id($test_oauth2_client_id);
is($client->get_oauth_2_handler()->get_client_id(), $test_oauth2_client_id);
