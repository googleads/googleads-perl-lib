#!/usr/bin/perl -w
#
# Copyright 2016, Google Inc. All Rights Reserved.
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
# This example adds a sitelinks feed and associates it with a campaign.

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201601::CampaignExtensionSetting;
use Google::Ads::AdWords::v201601::CampaignExtensionSettingOperation;
use Google::Ads::AdWords::v201601::SitelinkFeedItem;

use Cwd qw(abs_path);
use Data::Uniqid qw(uniqid);

# Replace with valid values of your account.
my $campaign_id = "INSERT_CAMPAIGN_ID_HERE";

# Example main subroutine.
sub add_site_links {
  my $client = shift;

  my $customer           = $client->CustomerService()->get();
  my $customer_time_zone = $customer->get_dateTimeZone();

  # Create the site links.
  my $site_link_1 = Google::Ads::AdWords::v201601::SitelinkFeedItem->new({
      sitelinkText      => 'Store Hours',
      sitelinkFinalUrls => Google::Ads::AdWords::v201601::UrlList->new(
        {urls => ['http://www.example.com/storehours']})});

  # Set the startTime and endTime to show the Thanksgiving specials link only
  # from 20 - 27 Nov.
  my $site_link_2 = Google::Ads::AdWords::v201601::SitelinkFeedItem->new({
      sitelinkText      => 'Thanksgiving Specials',
      sitelinkFinalUrls => Google::Ads::AdWords::v201601::UrlList->new(
        {urls => ['http://www.example.com/thanksgiving']})});

  # The time zone of the start and end date/times must match the time zone of
  # the customer.
  my ($sec, $min, $hour, $mday, $mon, $year) = localtime(time - (60 * 60 * 24));
  my $start_time =
    sprintf("%d1120 000000 %s", ($year + 1900), $customer_time_zone);
  my $end_time =
    sprintf("%d1127 235959 %s", ($year + 1900), $customer_time_zone);
  $site_link_2->set_startTime($start_time);
  $site_link_2->set_endTime($end_time);

  # Set the devicePreference to show the wifi details primarily for high end
  # mobile users.
  my $site_link_3 = Google::Ads::AdWords::v201601::SitelinkFeedItem->new({
      sitelinkText      => 'Wifi available',
      sitelinkFinalUrls => Google::Ads::AdWords::v201601::UrlList->new(
        {urls => ['http://www.example.com/mobile/wifi']}
      ),
      devicePreference =>
        Google::Ads::AdWords::v201601::FeedItemDevicePreference->new({
          # See https://developers.google.com/adwords/api/docs/appendix/platforms
          # for device criteria IDs.
          devicePreference => '30001'
        })});

  # Set the feedItemSchedules to show the happy hours link only during Mon - Fri
  # 6PM to 9PM.
  my $site_link_4 = Google::Ads::AdWords::v201601::SitelinkFeedItem->new({
      sitelinkText      => 'Happy hours',
      sitelinkFinalUrls => Google::Ads::AdWords::v201601::UrlList->new(
        {urls => ['http://www.example.com/mobile/happyhours']}
      ),
    });

  my @schedules = ();
  foreach my $day_name ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY')
  {
    push @schedules,
      Google::Ads::AdWords::v201601::FeedItemSchedule->new({
        'dayOfWeek'   => $day_name,
        'startHour'   => 18,
        'startMinute' => 'ZERO',
        'endHour'     => 21,
        'endMinute'   => 'ZERO',
      });
  }
  $site_link_4->set_scheduling(
    Google::Ads::AdWords::v201601::FeedItemScheduling->new(
      {feedItemSchedules => \@schedules}));

  my $campaign_extension_setting =
    Google::Ads::AdWords::v201601::CampaignExtensionSetting->new({
      campaignId       => $campaign_id,
      extensionType    => 'SITELINK',
      extensionSetting => Google::Ads::AdWords::v201601::ExtensionSetting->new({
          extensions => [$site_link_1, $site_link_2, $site_link_3, $site_link_4]
        })});

  my $mutate_result = $client->CampaignExtensionSettingService()->mutate({
      operations => [
        Google::Ads::AdWords::v201601::CampaignExtensionSettingOperation->new({
            operand  => $campaign_extension_setting,
            operator => 'ADD'
          })]});

  my $added_extension_setting = $mutate_result->get_value(0);

  printf "Extension setting with type = %s was added to campaign ID %d.\n",
    $added_extension_setting->get_extensionType(),
    $added_extension_setting->get_campaignId();
  return 1;
}

# Don't run the example if the file is being included.
if (abs_path($0) ne abs_path(__FILE__)) {
  return 1;
}

# Log SOAP XML request, response and API errors.
Google::Ads::AdWords::Logging::enable_all_logging();

# Get AdWords Client, credentials will be read from ~/adwords.properties.
my $client = Google::Ads::AdWords::Client->new({version => "v201601"});

# By default examples are set to die on any server returned fault.
$client->set_die_on_faults(1);

# Call the example
add_site_links($client, $campaign_id);
