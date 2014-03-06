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
# This example ads an ad extension override to an ad using an existing
# location ad extension. To get ads, run basic_operations/get_text_ads.pl.
#
# Tags: AdGroupCriterionService.mutate
# Author: David Torres <api.davidtorres@gmail.com>

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201306::AdExtension;
use Google::Ads::AdWords::v201306::AdExtensionOverride;
use Google::Ads::AdWords::v201306::AdExtensionOverrideOperation;
use Google::Ads::AdWords::v201306::LocationOverrideInfo;

use Cwd qw(abs_path);

# Replace with valid values of your account.
my $ad_id = "INSERT_AD_ID_HERE";
my $location_extension_id = "INSERT_LOCATION_EXTENSION_ID_HERE";

# Example main subroutine.
sub add_location_extension_override {
  my $client = shift;
  my $ad_id = shift;
  my $location_extension_id = shift;

  # Create ad extension using existing id.
  my $ad_extension = Google::Ads::AdWords::v201306::AdExtension->new({
    id => $location_extension_id
  });

  # Create ad extenstion override.
  my $ad_extension_override =
      Google::Ads::AdWords::v201306::AdExtensionOverride->new({
        adId => $ad_id, adExtension => $ad_extension,
        # Override info (non-required).
        overrideInfo =>
            Google::Ads::AdWords::v201306::OverrideInfo->new({
              LocationOverrideInfo =>
                  Google::Ads::AdWords::v201306::LocationOverrideInfo->new({
                    radius => 5,
                    radiusUnits => "MILES"
                  })
            })
      });

  # Create operations.
  my $ad_extension_override_operation =
      Google::Ads::AdWords::v201306::AdExtensionOverrideOperation->new({
        operator => "ADD",
        operand => $ad_extension_override
      });

  # Add ad extension override.
  my $result = $client->AdExtensionOverrideService()->mutate({
    operations => [$ad_extension_override_operation]
  });

  # Display ad extension overrides.
  if ($result->get_value()) {
    my $ad_extension_override = $result->get_value()->[0];
    printf "Location extension override with ad id \"%d\", id \"%d\", " .
           "and type \"%s\" was added.\n", $ad_extension_override->get_adId(),
           $ad_extension_override->get_adExtension()->get_id(),
           $ad_extension_override->get_adExtension()->get_AdExtension__Type();
  } else {
    print "No location extension override was added.";
  }

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
add_location_extension_override($client, $ad_id, $location_extension_id);
