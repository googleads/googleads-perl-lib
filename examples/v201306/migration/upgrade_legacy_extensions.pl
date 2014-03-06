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
# This example migrates legacy sitelinks to upgraded sitelinks for a given list
# of campaigns. The campaigns must be upgraded to enhanced campaigns before you
# can run this example. To upgrade a campaign to enhanced, run
# campaign_management/set_campaign_enhanced.pl. To get all campaigns, run
# basic_operations/get_campaigns.pl.
#
# Tags: CampaignAdExtensionService.get, CampaignAdExtensionService.mutate
# Tags: FeedService.mutate, FeedItemService.mutate, FeedMappingService.mutate
# Tags: CampaignFeedService.mutate
#
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
use Google::Ads::AdWords::v201306::Predicate;
use Google::Ads::AdWords::v201306::RequestContextOperand;
use Google::Ads::AdWords::v201306::Selector;

use Cwd qw(abs_path);
use Data::Uniqid qw(uniqid);

# See https://developers.google.com/adwords/api/docs/appendix/placeholders
# See the Placeholder reference page for a list of all the placeholder types
# and fields.
use constant PLACEHOLDER_SITELINKS => 1;

# See https://developers.google.com/adwords/api/docs/appendix/placeholders
# See the Placeholder reference page for a list of all the placeholder types
# and fields.
use constant PLACEHOLDER_FIELD_SITELINK_LINK_TEXT => 1;
use constant PLACEHOLDER_FIELD_SITELINK_URL => 2;

# Legacy AdExtensionType for sitelinks.
use constant SITELINKS_EXTENSION => "SITELINKS_EXTENSION";

# Replace with valid values of your account.
my $campaign_ids = ["INSERT_CAMPAIGN_ID_HERE",];

# Example main subroutine.
sub upgrade_legacy_extensions {
  my ($client, $campaign_ids) = @_;

  # Try to retrieve an existing feed that has been mapped for use with
  # sitelinks. if multiple such feeds exist, the first matching feed is
  # retrieved. You could modify this code example to retrieve all the feeds
  # and pick the appropriate feed based on user input.
  my $sitelinks_feed_data = get_existing_sitelinks_feed($client);

  if (!$sitelinks_feed_data) {
    # Create a feed for storing sitelinks.
    my $sitelinks_feed_data = create_sitelinks_feed($client);

    # Map the feed for using with sitelinks.
    create_sitelinks_feed_mapping($client, $sitelinks_feed_data);
  }

  for my $campaign_id (@{$campaign_ids}) {
    # Get legacy sitelinks for the campaign.
    my $legacy_extension =
        get_legacy_sitelinks_for_campaign($client, $campaign_id);

    if ($legacy_extension) {
      # Get the sitelinks.
      my $sitelinks = $legacy_extension->get_adExtension()->get_sitelinks();

      # Add the sitelinks to the feed.
      my $sitelink_feed_item_ids =
          create_sitelink_feed_items($client, $sitelinks_feed_data, $sitelinks);

      # Associate the feed items to the campaign.
      associate_sitelink_feed_items_with_campaign($client, $campaign_id,
          $sitelinks_feed_data, $sitelink_feed_item_ids);

      # Once the upgraded sitelinks are added to a campaign, the legacy
      # sitelinks will stop serving. You can delete the legacy sitelinks
      # once you have verified that the migration went fine. In case the
      # migration didn't succeed, you can roll back the migration by deleting
      # the CampaignFeed you created in the previous step.
      delete_legacy_sitelinks($client, $legacy_extension);
    }
  }

  return 1;
}

# Retrieve an existing feed that is mapped to hold sitelinks.
sub get_existing_sitelinks_feed {
  my $client = shift;

  my $placeholder_type_predicate =
      Google::Ads::AdWords::v201306::Predicate->new({
        field => "PlaceholderType",
        operator => "EQUALS",
        values => [PLACEHOLDER_SITELINKS]
      });
  my $status_predicate =
      Google::Ads::AdWords::v201306::Predicate->new({
        field => "Status",
        operator => "EQUALS",
        values => ["ACTIVE"]
      });

  my $selector = Google::Ads::AdWords::v201306::Selector->new({
    fields => ["FeedId", "FeedMappingId", "PlaceholderType", "Status",
        "AttributeFieldMappings"],
    predicates => [$placeholder_type_predicate, $status_predicate]
  });

  my $page = $client->FeedMappingService->get({
    selector => $selector
  });

  if ($page->get_entries() && scalar(@{$page->get_entries()}) > 0) {
    for my $feed_mapping (@{$page->get_entries()}) {
      my $feed_id = $feed_mapping->get_feedId();
      my $text_attribute_id;
      my $url_attribute_id;

      for my $attribute (@{$feed_mapping->get_attributeFieldMappings()}) {
        if ($attribute->get_fieldId()->get_value() ==
            PLACEHOLDER_FIELD_SITELINK_LINK_TEXT) {
          $text_attribute_id = $attribute->get_feedAttributeId();
        } elsif ($attribute->get_fieldId()->get_value() ==
            PLACEHOLDER_FIELD_SITELINK_URL) {
          $url_attribute_id = $attribute->get_feedAttributeId();
        }
      }

      if ($text_attribute_id && $url_attribute_id) {
        return {
          sitelinks_feed_id => $feed_id,
          link_text_feed_attribute_id => $text_attribute_id,
          link_url_feed_attribute_id => $url_attribute_id
        };
      }
    }
  }
}

# Create a feed for holding upgraded sitelinks.
sub create_sitelinks_feed {
  my $client = shift;

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
  my $saved_attributes = $saved_feed->get_attributes();

  return {
    sitelinks_feed_id => $saved_feed->get_id(),
    link_text_feed_attribute_id => $saved_attributes->[0]->get_id(),
    link_url_feed_attribute_id => $saved_attributes->[1]->get_id()
  };
}

# Map the feed for use with Sitelinks.
sub create_sitelinks_feed_mapping {
  my $client = shift;
  my $sitelinks_feed_data = shift;

  # Map the feed attribute IDs to the field ID constants.
  my $sitelink_text_field_mapping =
      Google::Ads::AdWords::v201306::AttributeFieldMapping->new({
        feedAttributeId => $sitelinks_feed_data->{link_text_feed_attribute_id},
        fieldId => PLACEHOLDER_FIELD_SITELINK_LINK_TEXT
      });
  my $sitelink_url_field_mapping =
      Google::Ads::AdWords::v201306::AttributeFieldMapping->new({
        feedAttributeId => $sitelinks_feed_data->{link_url_feed_attribute_id},
        fieldId => PLACEHOLDER_FIELD_SITELINK_URL
      });

  # Create the field mapping and operation.
  my $feed_mapping = Google::Ads::AdWords::v201306::FeedMapping->new({
    feedId => $sitelinks_feed_data->{sitelinks_feed_id},
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

  return $result->get_value()->[0];
}

# Get legacy sitelinks for a given campaign.
sub get_legacy_sitelinks_for_campaign {
  my $client = shift;
  my $campaign_id = shift;

  # Filter the results for a given campaign id.
  my $campaign_predicate = Google::Ads::AdWords::v201306::Predicate->new({
    field => "CampaignId",
    operator => "EQUALS",
    values => [$campaign_id]
  });

  # Filter the results for active campaign ad extensions. You may add
  # additional filtering conditions here as required.
  my $status_predicate = Google::Ads::AdWords::v201306::Predicate->new({
    field => "Status",
  operator => "EQUALS",
    values => ["ACTIVE"]
  });

  # Filter for sitelinks ad extension type.
  my $type_predicate = Google::Ads::AdWords::v201306::Predicate->new({
    field => "AdExtensionType",
    operator => "IN",
    values => [SITELINKS_EXTENSION]
  });

  # Create selector.
  my $selector = Google::Ads::AdWords::v201306::Selector->new({
    fields => ["AdExtensionId", "DisplayText","DestinationUrl"],
    predicates => [$campaign_predicate, $status_predicate, $type_predicate]
  });

  # Paginate through results.
  my $page = $client->CampaignAdExtensionService()->get({
    serviceSelector => $selector
  });

  # Display ad parameters.
  if ($page->get_entries() && scalar(@{$page->get_entries()})) {
    return $page->get_entries()->[0];
  }
}

# Add legacy sitelinks to the sitelinks feed.
sub create_sitelink_feed_items {
  my $client = shift;
  my $sitelinks_feed_data = shift;
  my $legacy_sitelinks = shift;

  my @sitelink_feed_item_ids = ();
  my @sitelink_feed_item_operations = ();

  # Create feed item operations for adding each legacy sitelink to the
  # sitelinks feed.
  for my $legacy_sitelink (@{$legacy_sitelinks}) {
    push(@sitelink_feed_item_operations,
        new_sitelink_feed_item_add_operation($sitelinks_feed_data,
            $legacy_sitelink->get_displayText(),
            $legacy_sitelink->get_destinationUrl()));
  }

  my $result = $client->FeedItemService()->mutate({
    operations => \@sitelink_feed_item_operations
  });

  # Retrieve the feed item ids.
  foreach my $feed_item (@{$result->get_value()}) {
    push(@sitelink_feed_item_ids, $feed_item->get_feedItemId());
  }

  return \@sitelink_feed_item_ids;
}

# Creates a new operation for adding a feed item.
sub new_sitelink_feed_item_add_operation {
  my $sitelink_feed_data = shift;
  my $text = shift;
  my $url = shift;

  # Create the FeedItemAttributeValues for our text values.
  my $link_text_attribute_value =
      Google::Ads::AdWords::v201306::FeedItemAttributeValue->new({
        feedAttributeId => $sitelink_feed_data->{link_text_feed_attribute_id},
        stringValue => $text
      });
  my $link_url_attribute_value =
      Google::Ads::AdWords::v201306::FeedItemAttributeValue->new({
        feedAttributeId => $sitelink_feed_data->{link_url_feed_attribute_id},
        stringValue => $url
      });

  # Create the feed item and operation.
  my $feed_item = Google::Ads::AdWords::v201306::FeedItem->new({
    feedId => $sitelink_feed_data->{sitelinks_feed_id},
    attributeValues => [$link_text_attribute_value, $link_url_attribute_value]
  });

  return Google::Ads::AdWords::v201306::FeedItemOperation->new({
      operand => $feed_item,
      operator => "ADD"
  });
}

# Associates sitelink feed items with a campaign.
sub associate_sitelink_feed_items_with_campaign {
  my $client = shift;
  my $campaign_id = shift;
  my $sitelinks_feed_data = shift;
  my $sitelink_feed_item_ids = shift;

  # Create a custom matching function that matches the given feed items to
  # the campaign.
  my $request_context_operand =
      Google::Ads::AdWords::v201306::RequestContextOperand->new({
        contextType => "FEED_ITEM_ID"
      });
  my @operands = ();
  foreach my $feed_item_id (@{$sitelink_feed_item_ids}) {
    my $operand = Google::Ads::AdWords::v201306::ConstantOperand->new({
      longValue => $feed_item_id,
      type => "LONG"
    });
    push(@operands, $operand);
  }
  my $function = Google::Ads::AdWords::v201306::Function->new({
    lhsOperand => [$request_context_operand],
    operator => "IN",
    rhsOperand => \@operands
  });

  # Create upgraded sitelinks for the campaign. Use the sitelinks feed we
  # created, and restrict feed items by matching function.
  my $campaign_feed = Google::Ads::AdWords::v201306::CampaignFeed->new({
    feedId => $sitelinks_feed_data->{sitelinks_feed_id},
    campaignId => $campaign_id,
    matchingFunction => $function,
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
}

# Delete legacy sitelinks from a campaign.
sub delete_legacy_sitelinks {
  my $client = shift;
  my $legacy_extension = shift;

  my $operation =
      Google::Ads::AdWords::v201306::CampaignAdExtensionOperation->new({
        operator => "REMOVE",
        operand => $legacy_extension
      });

  $client->CampaignAdExtensionService()->mutate({
    operations => [$operation]
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
upgrade_legacy_extensions($client, $campaign_ids);
