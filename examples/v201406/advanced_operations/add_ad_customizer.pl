#!/usr/bin/perl -w
#
# Copyright 2014, Google Inc. All Rights Reserved.
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
# This example adds an ad customizer feed and associates it with the customer.
# Then it adds an ad that uses the feed to populate dynamic data.
#
# Tags: CustomerFeedService.mutate, FeedItemService.mutate, FeedMappingService.mutate
# Tags: FeedService.mutate
# Author: Josh Radcliff <api.jradcliff@gmail.com>

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201406::AttributeFieldMapping;
use Google::Ads::AdWords::v201406::AdGroupAd;
use Google::Ads::AdWords::v201406::AdGroupAdOperation;
use Google::Ads::AdWords::v201406::ConstantOperand;
use Google::Ads::AdWords::v201406::CustomerFeed;
use Google::Ads::AdWords::v201406::CustomerFeedOperation;
use Google::Ads::AdWords::v201406::Feed;
use Google::Ads::AdWords::v201406::FeedAttribute;
use Google::Ads::AdWords::v201406::FeedItem;
use Google::Ads::AdWords::v201406::FeedItemAdGroupTargeting;
use Google::Ads::AdWords::v201406::FeedItemAttributeValue;
use Google::Ads::AdWords::v201406::FeedItemOperation;
use Google::Ads::AdWords::v201406::FeedMapping;
use Google::Ads::AdWords::v201406::FeedMappingOperation;
use Google::Ads::AdWords::v201406::FeedOperation;
use Google::Ads::AdWords::v201406::Function;
use Google::Ads::AdWords::v201406::FunctionOperand;
use Google::Ads::AdWords::v201406::RequestContextOperand;
use Google::Ads::AdWords::v201406::TextAd;

use Cwd qw(abs_path);
use Data::Uniqid qw(uniqid);

# See the Placeholder reference page for a list of all the placeholder types and
# fields.
# https://developers.google.com/adwords/api/docs/appendix/placeholders
use constant PLACEHOLDER_AD_CUSTOMIZER => 10;
use constant PLACEHOLDER_FIELD_AD_CUSTOMIZER_PRICE => 3;
use constant PLACEHOLDER_FIELD_AD_CUSTOMIZER_DATE => 4;
use constant PLACEHOLDER_FIELD_AD_CUSTOMIZER_STRING => 5;

# Replace with valid values of your account.
my $ad_group_ids = ["INSERT_ADGROUP_ID_HERE", "INSERT_ADGROUP_ID_HERE"];

# Example main subroutine.
sub add_ad_customizers {
  my $client = shift;

  my $ad_group_ids = shift;

  my $customizers_data = {
    "customizersFeedId" => 0,
    "nameFeedAttributeId" => 0,
    "priceFeedAttributeId" => 0,
    "dateFeedAttributeId" => 0
  };

  # Create a customizer feed. One feed per account can be used for all ads.
  create_customizer_feed($client, $customizers_data);

  # Create a feed mapping to map the fields with customizer IDs.
  create_customizer_feed_mapping($client, $customizers_data);

  # Add feed items containing the values we'd like to place in ads.
  create_customizer_feed_items($client, $customizers_data, $ad_group_ids);

  # Create a customer (account-level) feed with a matching function that
  # determines when to use this feed. For this case we use the "IDENTITY"
  # matching function that is always true just to associate this feed with the
  # customer. The targeting is done within the feed items using the
  # campaignTargeting, adGroupTargeting, or keywordTargeting attributes.
  create_customizer_customer_feed($client, $customizers_data);

  # All set! We can now create ads with customizations.
  create_ads_with_customizations($client, $ad_group_ids);

  return 1;
}

sub create_customizer_feed() {
  my ($client, $customizers_data) = @_;

  my $name_attribute = Google::Ads::AdWords::v201406::FeedAttribute->new({
    type => "STRING",
    name => "Name"
  });
  my $price_attribute = Google::Ads::AdWords::v201406::FeedAttribute->new({
    type => "STRING",
    name => "Price"
  });
  my $date_attribute = Google::Ads::AdWords::v201406::FeedAttribute->new({
    type => "DATE_TIME",
    name => "Date"
  });
  my $feed = Google::Ads::AdWords::v201406::Feed->new({
    name => "CustomizerFeed",
    attributes => [$name_attribute, $price_attribute, $date_attribute],
    origin => "USER"
  });

  my $operation =
    Google::Ads::AdWords::v201406::FeedOperation->new({
      operator => "ADD",
      operand => $feed
  });

  my $feed_result = $client->FeedService()->mutate({
    operations => [$operation]
  });

  my $saved_feed = $feed_result->get_value(0);

  $customizers_data->{"customizersFeedId"} = $saved_feed->get_id();

  my $saved_attributes = $saved_feed->get_attributes();

  $customizers_data->{"nameFeedAttributeId"} = $saved_attributes->[0]->
    get_id();
  $customizers_data->{"priceFeedAttributeId"} = $saved_attributes->[1]->
    get_id();
  $customizers_data->{"dateFeedAttributeId"} = $saved_attributes->[2]->
    get_id();
  printf("Feed with name '%s' and ID %d with nameAttributeId %d" .
    " and priceAttributeId %d and dateAttributeId %d was created.\n",
    $saved_feed->get_name(),
    $saved_feed->get_id(),
    $saved_attributes->[0]->get_id(),
    $saved_attributes->[1]->get_id(),
    $saved_attributes->[2]->get_id(),
  );
}

sub create_customizer_feed_mapping() {
  my ($client, $customizers_data) = @_;

  # Map the FeedAttributeIds to the fieldId constants.
  my $name_field_mapping =
    Google::Ads::AdWords::v201406::AttributeFieldMapping->new({
      feedAttributeId => $customizers_data->{"nameFeedAttributeId"},
      fieldId => PLACEHOLDER_FIELD_AD_CUSTOMIZER_STRING
  });
  my $price_field_mapping =
    Google::Ads::AdWords::v201406::AttributeFieldMapping->new({
      feedAttributeId => $customizers_data->{"priceFeedAttributeId"},
      fieldId => PLACEHOLDER_FIELD_AD_CUSTOMIZER_PRICE
  });
  my $date_field_mapping =
    Google::Ads::AdWords::v201406::AttributeFieldMapping->new({
      feedAttributeId => $customizers_data->{"dateFeedAttributeId"},
      fieldId => PLACEHOLDER_FIELD_AD_CUSTOMIZER_DATE
  });

  # Create the FeedMapping and operation.
  my $feed_mapping = Google::Ads::AdWords::v201406::FeedMapping->new({
    placeholderType => PLACEHOLDER_AD_CUSTOMIZER,
    feedId => $customizers_data->{"customizersFeedId"},
    attributeFieldMappings => [
      $name_field_mapping, $price_field_mapping, $date_field_mapping
    ]
  });

  my $operation = Google::Ads::AdWords::v201406::FeedMappingOperation->new({
    operand => $feed_mapping,
    operator => "ADD"
  });

  # Save the feed mapping.
  my $result = $client->FeedMappingService()->mutate({
    operations => [$operation]
  });

  foreach my $saved_feed_mapping (@{$result->get_value()}) {
    printf "Feed mapping with ID %d and placeholderType %d was saved for " .
      "feed with ID %d.\n", $saved_feed_mapping->get_feedMappingId(),
      $saved_feed_mapping->get_placeholderType(),
      $saved_feed_mapping->get_feedId();
  }
}

sub create_customizer_feed_items() {
  my ($client, $customizers_data, $ad_group_ids) = @_;

  my @operations = ();

  push @operations, create_feed_item_add_operation($customizers_data,
    "Mars", "\$1234.56", "20140601 000000", $ad_group_ids->[0]);
  push @operations, create_feed_item_add_operation($customizers_data,
    "Venus", "\$1450.00", "20140615 120000", $ad_group_ids->[1]);

  my $result = $client->FeedItemService()->mutate({
    operations => \@operations
  });

  foreach my $feed_item (@{$result->get_value()}) {
    printf "FeedItem with feedItemId %d was added.\n",
      $feed_item->get_feedItemId();
  }
}

sub create_feed_item_add_operation() {
  my ($customizers_data, $name, $price, $date, $ad_group_id) = @_;

  my $name_attribute_value =
    Google::Ads::AdWords::v201406::FeedItemAttributeValue->new({
      feedAttributeId => $customizers_data->{"nameFeedAttributeId"},
      stringValue => $name
  });
  my $price_attribute_value =
    Google::Ads::AdWords::v201406::FeedItemAttributeValue->new({
      feedAttributeId => $customizers_data->{"priceFeedAttributeId"},
      stringValue => $price
  });
  my $date_attribute_value =
    Google::Ads::AdWords::v201406::FeedItemAttributeValue->new({
      feedAttributeId => $customizers_data->{"dateFeedAttributeId"},
      stringValue => $date
  });

  my $feed_item = Google::Ads::AdWords::v201406::FeedItem->new({
    feedId => $customizers_data->{"customizersFeedId"},
    attributeValues => [
      $name_attribute_value, $price_attribute_value, $date_attribute_value
    ],
    adGroupTargeting =>
      Google::Ads::AdWords::v201406::FeedItemAdGroupTargeting->new({
        TargetingAdGroupId => $ad_group_id
    })
  });

  my $operation = Google::Ads::AdWords::v201406::FeedItemOperation->new({
    operand => $feed_item,
    operator => "ADD"
  });

  return $operation;
}

sub create_customizer_customer_feed() {
  my ($client, $customizers_data) = @_;

  # Create a CustomerFeed that will associate the Feed with the ad customizers
  # placeholder type.
  my $customer_feed = Google::Ads::AdWords::v201406::CustomerFeed->new({
    feedId => $customizers_data->{"customizersFeedId"},
    placeholderTypes => [PLACEHOLDER_AD_CUSTOMIZER]
  });

  # Create a matching function that will always evaluate to true.
  my $customer_matching_function =
    Google::Ads::AdWords::v201406::Function->new({
      lhsOperand => [
        Google::Ads::AdWords::v201406::ConstantOperand->new({
          type => "BOOLEAN",
          booleanValue => 1
        })
      ],
      operator => "IDENTITY"
  });

  $customer_feed->set_matchingFunction($customer_matching_function);

  my $result = $client->CustomerFeedService()->mutate({
    operations => [
      Google::Ads::AdWords::v201406::CustomerFeedOperation->new({
        operand => $customer_feed,
        operator => "ADD"
      })
    ]
  });

  $customer_feed = $result->get_value(0);

  printf "Customer feed for feed ID %d was added.\n",
    $customer_feed->get_feedId();
}

sub create_ads_with_customizations() {
  my ($client, $ad_group_ids) = @_;

  my $text_ad = Google::Ads::AdWords::v201406::TextAd->new({
    headline => 'Luxury Cruise to {=CustomizerFeed.Name}',
    description1 => 'Only {=CustomizerFeed.Price}',
    description2 => 'Offer ends in {=countdown(CustomizerFeed.Date)}!',
    url => 'http://www.example.com',
    displayUrl => 'www.example.com'
  });

  # We add the same ad to both ad groups. When they serve, they will show
  # different values, since they match different feed items.
  my @operations = ();

  foreach my $ad_group_id (@{$ad_group_ids}) {
    push @operations, Google::Ads::AdWords::v201406::AdGroupAdOperation->new({
      operator => "ADD",
      operand => Google::Ads::AdWords::v201406::AdGroupAd->new({
        adGroupId => $ad_group_id,
        ad => $text_ad
      })
    });
  }

  my $result = $client->AdGroupAdService()->mutate({
    operations => \@operations
  });

  foreach my $ad_group_ad (@{$result->get_value()}) {
    printf "Created an ad with ID %d, type '%s', and status '%s'.\n",
      $ad_group_ad->get_ad()->get_id(), $ad_group_ad->get_ad()->get_Ad__Type(),
      $ad_group_ad->get_status();
  }
}

# Don't run the example if the file is being included.
if (abs_path($0) ne abs_path(__FILE__)) {
  return 1;
}

# Log SOAP XML request, response and API errors.
Google::Ads::AdWords::Logging::enable_all_logging();

# Get AdWords Client, credentials will be read from ~/adwords.properties.
my $client = Google::Ads::AdWords::Client->new({version => "v201406"});

# By default examples are set to die on any server returned fault.
$client->set_die_on_faults(1);

# Call the example
add_ad_customizers($client, $ad_group_ids);
