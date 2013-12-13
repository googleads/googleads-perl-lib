#!/usr/bin/perl -w
#
# Copyright 2013, Google Inc. All Rights Reserved.
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
# This code example adds text ads to a given ad group. To get ad groups,
# run basic_operations/get_ad_groups.pl.
#
# Tags: CampaignFeedService.mutate, FeedService.mutate, FeedItemService.mutate,
#       FeedMappingService.mutate
# Author: David Torres <api.davidtorres@gmail.com>

use strict;
use lib "../../../lib";

use Google::Ads::AdWords::Client;
use Google::Ads::AdWords::Logging;
use Google::Ads::AdWords::v201306::AttributeFieldMapping;
use Google::Ads::AdWords::v201306::ConstantOperand;
use Google::Ads::AdWords::v201306::CampaignFeed;
use Google::Ads::AdWords::v201306::CampaignFeedOperation;
use Google::Ads::AdWords::v201306::Feed;
use Google::Ads::AdWords::v201306::FeedAttribute;
use Google::Ads::AdWords::v201306::FeedItem;
use Google::Ads::AdWords::v201306::FeedItemAttributeValue;
use Google::Ads::AdWords::v201306::FeedItemOperation;
use Google::Ads::AdWords::v201306::FeedMapping;
use Google::Ads::AdWords::v201306::FeedMappingOperation;
use Google::Ads::AdWords::v201306::FeedOperation;
use Google::Ads::AdWords::v201306::Function;
use Google::Ads::AdWords::v201306::FunctionOperand;
use Google::Ads::AdWords::v201306::RequestContextOperand;

use Cwd qw(abs_path);
use Data::Uniqid qw(uniqid);

# Replace with valid values of your account.
my $campaign_id = "INSERT_CAMPAIGN_ID_HERE";

# Example main subroutine.
sub add_sitelinks {
  my $client = shift;
  my $campaign_id = shift;

  my $sitelinks_data = {
    sitelinks_feed_id => 0,
    link_text_feed_attribute_id => 0,
    link_url_feed_attribute_id => 0,
    sitelinks_feed_item_ids => []
  };

  create_sitelinks_feed($client, $sitelinks_data);
  create_sitelinks_feed_items($client, $sitelinks_data);
  create_sitelinks_feed_mapping($client, $sitelinks_data);
  create_sitelinks_campaign_feed($client, $sitelinks_data, $campaign_id);

  return 1;
}

sub create_sitelinks_feed {
  my $client = shift;
  my $sitelink_data = shift;

  # Create attributes.
  my $text_attribute = Google::Ads::AdWords::v201306::FeedAttribute->new({
    type => "STRING",
    name => "Link Text"
  });
  my $url_attribute = Google::Ads::AdWords::v201306::FeedAttribute->new({
    type => "URL",
    name => "Link URL"
  });

  # Create the feed.
  my $sitelink_feed = Google::Ads::AdWords::v201306::Feed->new({
    name => "Feed for Sitelinks",
    attributes => [$text_attribute, $url_attribute],
    origin => "USER"
  });

  # Create operation.
  my $operation = Google::Ads::AdWords::v201306::FeedOperation->new({
    operand => $sitelink_feed,
    operator => "ADD"
  });

  # Add the feed.
  my $result = $client->FeedService()->mutate({
    operations => [$operation]
  });

  # Retrieved saved ids.
  my $saved_feed = $result->get_value()->[0];
  $sitelink_data->{sitelinks_feed_id} = $saved_feed->get_id();
  my $saved_attributes = $saved_feed->get_attributes();
  $sitelink_data->{link_text_feed_attribute_id} =
      $saved_attributes->[0]->get_id();
  $sitelink_data->{link_url_feed_attribute_id} =
      $saved_attributes->[1]->get_id();

  # Print result.
  printf "Feed with name '%s' and ID %d with linkTextAttributeId %d and " .
         "linkUrlAttribute ID %d was created.\n",
         $saved_feed->get_name(),
         $saved_feed->get_id(),
         $saved_attributes->[0]->get_id(),
         $saved_attributes->[1]->get_id();
}

sub create_sitelinks_feed_items {
  my $client = shift;
  my $sitelink_data = shift;

  # Create operations to add feed items.
  my $home = new_sitelink_feed_item_add_operation($sitelink_data, "Home",
      "http://www.example.com");
  my $stores = new_sitelink_feed_item_add_operation($sitelink_data, "Stores",
      "http://www.example.com/stores");
  my $sale = new_sitelink_feed_item_add_operation($sitelink_data, "On sale",
      "http://www.example.com/sale");
  my $support = new_sitelink_feed_item_add_operation($sitelink_data, "Support",
      "http://www.example.com/support");
  my $products = new_sitelink_feed_item_add_operation($sitelink_data, "Products",
      "http://www.example.com/products");
  my $about = new_sitelink_feed_item_add_operation($sitelink_data, "About Us",
      "http://www.example.com/about");

  # Add feed items.
  my $result = $client->FeedItemService()->mutate({
    operations => [$home, $stores, $sale, $support, $products, $about]
  });

  foreach my $feed_item (@{$result->get_value()}) {
    printf "FeedItem with feedItemId %d was added.\n",
           $feed_item->get_feedItemId();
    push(@{$sitelink_data->{sitelink_feed_item_ids}},
         $feed_item->get_feedItemId());
  }
}

# See https://developers.google.com/adwords/api/docs/appendix/placeholders
# See the Placeholder reference page for a list of all the placeholder types
# and fields.
use constant PLACEHOLDER_SITELINKS => 1;

# See https://developers.google.com/adwords/api/docs/appendix/placeholders
# See the Placeholder reference page for a list of all the placeholder types
# and fields.
use constant PLACEHOLDER_FIELD_SITELINK_LINK_TEXT => 1;
use constant PLACEHOLDER_FIELD_SITELINK_URL => 2;

sub create_sitelinks_feed_mapping {
  my $client = shift;
  my $sitelink_data = shift;

  # Map the feed attribute IDs to the field ID constants.
  my $sitelink_text_field_mapping =
      Google::Ads::AdWords::v201306::AttributeFieldMapping->new({
        feedAttributeId => $sitelink_data->{link_text_feed_attribute_id},
        fieldId => PLACEHOLDER_FIELD_SITELINK_LINK_TEXT
      });
  my $sitelink_url_field_mapping =
      Google::Ads::AdWords::v201306::AttributeFieldMapping->new({
        feedAttributeId => $sitelink_data->{link_url_feed_attribute_id},
        fieldId => PLACEHOLDER_FIELD_SITELINK_URL
      });

  # Create the field mapping and operation.
  my $feed_mapping = Google::Ads::AdWords::v201306::FeedMapping->new({
    feedId => $sitelink_data->{sitelinks_feed_id},
    placeholderType => PLACEHOLDER_SITELINKS,
    attributeFieldMappings => [
      $sitelink_text_field_mapping,
      $sitelink_url_field_mapping
    ]
  });
  my $operation = Google::Ads::AdWords::v201306::FeedMappingOperation->new({
    operand => $feed_mapping,
    operator => "ADD"
  });

  # Save the field mapping.
  my $result = $client->FeedMappingService()->mutate({
    operations => [$operation]
  });

  my $saved_feed_mapping = $result->get_value()->[0];
  printf "Feed mapping with ID %d and placeholderType %d was saved for " .
         "feed with ID %d.\n",
         $saved_feed_mapping->get_feedMappingId(),
         $saved_feed_mapping->get_placeholderType(),
         $saved_feed_mapping->get_feedId();
}

sub create_sitelinks_campaign_feed {
  my $client = shift;
  my $sitelink_data = shift;
  my $campaign_id = shift;

  # Create feeds items matching function.
  my $feed_item_request_context_operand =
      Google::Ads::AdWords::v201306::RequestContextOperand->new({
        contextType => "FEED_ITEM_ID"
      });
  my @feed_item_operands = ();
  foreach my $feed_item_id (@{$sitelink_data->{sitelink_feed_item_ids}}) {
    my $operand = Google::Ads::AdWords::v201306::ConstantOperand->new({
      longValue => $feed_item_id,
      type => "LONG"
    });
    push(@feed_item_operands, $operand);
  }
  my $feed_item_function = Google::Ads::AdWords::v201306::Function->new({
    lhsOperand => [$feed_item_request_context_operand],
    operator => "IN",
    rhsOperand => \@feed_item_operands
  });

  my $platform_function = Google::Ads::AdWords::v201306::Function->new({
    operator => "EQUALS",
    lhsOperand => [Google::Ads::AdWords::v201306::RequestContextOperand->new({
          contextType => "DEVICE_PLATFORM"
        })],
    rhsOperand => [Google::Ads::AdWords::v201306::ConstantOperand->new({
          type => "STRING",
          stringValue => 'Mobile'
        })]
  });

  my $combined_function = Google::Ads::AdWords::v201306::Function->new({
    operator => "AND",
    lhsOperand => [Google::Ads::AdWords::v201306::FunctionOperand->new({
        value => $feed_item_function
      }),
      Google::Ads::AdWords::v201306::FunctionOperand->new({
        value => $platform_function
      })
    ],
  });

  # Create campaign feed and operation.
  my $campaign_feed = Google::Ads::AdWords::v201306::CampaignFeed->new({
    feedId => $sitelink_data->{sitelinks_feed_id},
    campaignId => $campaign_id,
    matchingFunction => $combined_function,
    placeholderTypes => [PLACEHOLDER_SITELINKS]
  });
  my $operation = Google::Ads::AdWords::v201306::CampaignFeedOperation->new({
    operand => $campaign_feed,
    operator => "ADD"
  });

  # Save the campaign feed.
  my $result = $client->CampaignFeedService()->mutate({
    operations => [$operation]
  });
  # Display result.
  my $saved_campaign_feed = $result->get_value()->[0];
  printf "New campaign with ID %d was associated with feed with ID %d.\n",
         $saved_campaign_feed->get_campaignId(),
         $saved_campaign_feed->get_feedId();
}

sub new_sitelink_feed_item_add_operation {
  my $sitelink_data = shift;
  my $text = shift;
  my $url = shift;

  my $link_text_attribute_value =
      Google::Ads::AdWords::v201306::FeedItemAttributeValue->new({
        feedAttributeId => $sitelink_data->{link_text_feed_attribute_id},
        stringValue => $text,

      });
  my $link_url_attribute_value =
      Google::Ads::AdWords::v201306::FeedItemAttributeValue->new({
        feedAttributeId => $sitelink_data->{link_url_feed_attribute_id},
        stringValue => $url
      });

  my $feed_item = Google::Ads::AdWords::v201306::FeedItem->new({
    feedId => $sitelink_data->{sitelinks_feed_id},
    attributeValues => [$link_text_attribute_value, $link_url_attribute_value]
  });

  return Google::Ads::AdWords::v201306::FeedItemOperation->new({
      operand => $feed_item,
      operator => "ADD"
    });
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
add_sitelinks($client, $campaign_id);
