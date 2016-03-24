package Google::Ads::AdWords::v201603::Operand;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201603' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %Ad_of :ATTR(:get<Ad>);
my %AdGroup_of :ATTR(:get<AdGroup>);
my %AdGroupAd_of :ATTR(:get<AdGroupAd>);
my %AdGroupAdLabel_of :ATTR(:get<AdGroupAdLabel>);
my %AdGroupBidModifier_of :ATTR(:get<AdGroupBidModifier>);
my %AdGroupCriterion_of :ATTR(:get<AdGroupCriterion>);
my %AdGroupCriterionLabel_of :ATTR(:get<AdGroupCriterionLabel>);
my %AdGroupExtensionSetting_of :ATTR(:get<AdGroupExtensionSetting>);
my %AdGroupLabel_of :ATTR(:get<AdGroupLabel>);
my %Budget_of :ATTR(:get<Budget>);
my %Campaign_of :ATTR(:get<Campaign>);
my %CampaignCriterion_of :ATTR(:get<CampaignCriterion>);
my %CampaignExtensionSetting_of :ATTR(:get<CampaignExtensionSetting>);
my %CampaignLabel_of :ATTR(:get<CampaignLabel>);
my %CustomerExtensionSetting_of :ATTR(:get<CustomerExtensionSetting>);
my %ExtensionFeedItem_of :ATTR(:get<ExtensionFeedItem>);
my %FeedItem_of :ATTR(:get<FeedItem>);
my %Label_of :ATTR(:get<Label>);
my %Media_of :ATTR(:get<Media>);

__PACKAGE__->_factory(
    [ qw(        Ad
        AdGroup
        AdGroupAd
        AdGroupAdLabel
        AdGroupBidModifier
        AdGroupCriterion
        AdGroupCriterionLabel
        AdGroupExtensionSetting
        AdGroupLabel
        Budget
        Campaign
        CampaignCriterion
        CampaignExtensionSetting
        CampaignLabel
        CustomerExtensionSetting
        ExtensionFeedItem
        FeedItem
        Label
        Media

    ) ],
    {
        'Ad' => \%Ad_of,
        'AdGroup' => \%AdGroup_of,
        'AdGroupAd' => \%AdGroupAd_of,
        'AdGroupAdLabel' => \%AdGroupAdLabel_of,
        'AdGroupBidModifier' => \%AdGroupBidModifier_of,
        'AdGroupCriterion' => \%AdGroupCriterion_of,
        'AdGroupCriterionLabel' => \%AdGroupCriterionLabel_of,
        'AdGroupExtensionSetting' => \%AdGroupExtensionSetting_of,
        'AdGroupLabel' => \%AdGroupLabel_of,
        'Budget' => \%Budget_of,
        'Campaign' => \%Campaign_of,
        'CampaignCriterion' => \%CampaignCriterion_of,
        'CampaignExtensionSetting' => \%CampaignExtensionSetting_of,
        'CampaignLabel' => \%CampaignLabel_of,
        'CustomerExtensionSetting' => \%CustomerExtensionSetting_of,
        'ExtensionFeedItem' => \%ExtensionFeedItem_of,
        'FeedItem' => \%FeedItem_of,
        'Label' => \%Label_of,
        'Media' => \%Media_of,
    },
    {
        'Ad' => 'Google::Ads::AdWords::v201603::Ad',
        'AdGroup' => 'Google::Ads::AdWords::v201603::AdGroup',
        'AdGroupAd' => 'Google::Ads::AdWords::v201603::AdGroupAd',
        'AdGroupAdLabel' => 'Google::Ads::AdWords::v201603::AdGroupAdLabel',
        'AdGroupBidModifier' => 'Google::Ads::AdWords::v201603::AdGroupBidModifier',
        'AdGroupCriterion' => 'Google::Ads::AdWords::v201603::AdGroupCriterion',
        'AdGroupCriterionLabel' => 'Google::Ads::AdWords::v201603::AdGroupCriterionLabel',
        'AdGroupExtensionSetting' => 'Google::Ads::AdWords::v201603::AdGroupExtensionSetting',
        'AdGroupLabel' => 'Google::Ads::AdWords::v201603::AdGroupLabel',
        'Budget' => 'Google::Ads::AdWords::v201603::Budget',
        'Campaign' => 'Google::Ads::AdWords::v201603::Campaign',
        'CampaignCriterion' => 'Google::Ads::AdWords::v201603::CampaignCriterion',
        'CampaignExtensionSetting' => 'Google::Ads::AdWords::v201603::CampaignExtensionSetting',
        'CampaignLabel' => 'Google::Ads::AdWords::v201603::CampaignLabel',
        'CustomerExtensionSetting' => 'Google::Ads::AdWords::v201603::CustomerExtensionSetting',
        'ExtensionFeedItem' => 'Google::Ads::AdWords::v201603::ExtensionFeedItem',
        'FeedItem' => 'Google::Ads::AdWords::v201603::FeedItem',
        'Label' => 'Google::Ads::AdWords::v201603::Label',
        'Media' => 'Google::Ads::AdWords::v201603::Media',
    },
    {

        'Ad' => 'Ad',
        'AdGroup' => 'AdGroup',
        'AdGroupAd' => 'AdGroupAd',
        'AdGroupAdLabel' => 'AdGroupAdLabel',
        'AdGroupBidModifier' => 'AdGroupBidModifier',
        'AdGroupCriterion' => 'AdGroupCriterion',
        'AdGroupCriterionLabel' => 'AdGroupCriterionLabel',
        'AdGroupExtensionSetting' => 'AdGroupExtensionSetting',
        'AdGroupLabel' => 'AdGroupLabel',
        'Budget' => 'Budget',
        'Campaign' => 'Campaign',
        'CampaignCriterion' => 'CampaignCriterion',
        'CampaignExtensionSetting' => 'CampaignExtensionSetting',
        'CampaignLabel' => 'CampaignLabel',
        'CustomerExtensionSetting' => 'CustomerExtensionSetting',
        'ExtensionFeedItem' => 'ExtensionFeedItem',
        'FeedItem' => 'FeedItem',
        'Label' => 'Label',
        'Media' => 'Media',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201603::Operand

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
Operand from the namespace https://adwords.google.com/api/adwords/cm/v201603.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * Ad


=item * AdGroup


=item * AdGroupAd


=item * AdGroupAdLabel


=item * AdGroupBidModifier


=item * AdGroupCriterion


=item * AdGroupCriterionLabel


=item * AdGroupExtensionSetting


=item * AdGroupLabel


=item * Budget


=item * Campaign


=item * CampaignCriterion


=item * CampaignExtensionSetting


=item * CampaignLabel


=item * CustomerExtensionSetting


=item * ExtensionFeedItem


=item * FeedItem


=item * Label


=item * Media




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

