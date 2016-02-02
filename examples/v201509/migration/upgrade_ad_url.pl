#!/usr/bin/perl -w
#
# Copyright 2015, Google Inc. All Rights Reserved.
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
# This code example upgrades an ad to use upgraded URLs.

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201509::AdUrlUpgrade;
use Google::Ads::AdWords::v201509::Predicate;
use Google::Ads::AdWords::v201509::Selector;

# Replace with valid values of your account.
my $ad_group_id = "INSERT_AD_GROUP_ID_HERE";
my $ad_id       = "INSERT_AD_ID_HERE";

use Cwd qw(abs_path);

# Example main subroutine.
sub upgrade_ad_url {
  my ($client, $ad_group_id, $ad_id) = @_;

  # Retrieve the ad.
  my $ad_group_ad = get_ad_group_ad($client, $ad_group_id, $ad_id);

  if ($ad_group_ad) {
    # Copy the destination URL to the final URL.
    my $ad_url_upgrade = Google::Ads::AdWords::v201509::AdUrlUpgrade->new({
        adId     => $ad_group_ad->get_ad()->get_id(),
        finalUrl => $ad_group_ad->get_ad()->get_url()});

    # Upgrade the ad.
    my $upgraded_ads =
      $client->AdGroupAdService()
      ->upgradeUrl({operations => [$ad_url_upgrade]});

    # Display the results.
    if ($upgraded_ads) {
      foreach my $upgraded_ad (@{$upgraded_ads}) {
        printf "Ad with ID %d and destination URL '%s' was upgraded.\n",
          $upgraded_ad->get_id(), $upgraded_ad->get_finalUrls()->[0];
      }
    } else {
      printf "No ads were upgraded.\n";
    }

  } else {
    printf "Ad not found.\n";
  }

  return 1;
}

sub get_ad_group_ad {
  my ($client, $ad_group_id, $ad_id) = @_;

  my $ad_group_id_predicate = Google::Ads::AdWords::v201509::Predicate->new({
      field    => "AdGroupId",
      operator => "EQUALS",
      values   => [$ad_group_id]});

  my $ad_id_predicate = Google::Ads::AdWords::v201509::Predicate->new({
      field    => "Id",
      operator => "EQUALS",
      values   => [$ad_id]});

  my $selector = Google::Ads::AdWords::v201509::Selector->new({
      fields     => ["Id",                   "Url"],
      predicates => [$ad_group_id_predicate, $ad_id_predicate],
  });

  my $page = $client->AdGroupAdService()->get({serviceSelector => $selector});
  if ($page->get_entries()) {
    return $page->get_entries()->[0];
  }

  return undef;
}

# Don't run the example if the file is being included.
if (abs_path($0) ne abs_path(__FILE__)) {
  return 1;
}

# Log SOAP XML request, response and API errors.
Google::Ads::AdWords::Logging::enable_all_logging();

# Get AdWords Client, credentials will be read from ~/adwords.properties.
my $client = Google::Ads::AdWords::Client->new({version => "v201509"});

# By default examples are set to die on any server returned fault.
$client->set_die_on_faults(1);

# Call the example
upgrade_ad_url($client, $ad_group_id, $ad_id);
