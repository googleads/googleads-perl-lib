package Google::Ads::AdWords::v201502::Operand;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201502' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %AdGroupAdLabel_of :ATTR(:get<AdGroupAdLabel>);
my %AdGroupAd_of :ATTR(:get<AdGroupAd>);
my %AdGroupBidModifier_of :ATTR(:get<AdGroupBidModifier>);
my %AdGroupCriterionLabel_of :ATTR(:get<AdGroupCriterionLabel>);
my %AdGroupCriterion_of :ATTR(:get<AdGroupCriterion>);
my %AdGroupLabel_of :ATTR(:get<AdGroupLabel>);
my %AdGroup_of :ATTR(:get<AdGroup>);
my %Ad_of :ATTR(:get<Ad>);
my %Budget_of :ATTR(:get<Budget>);
my %CampaignAdExtension_of :ATTR(:get<CampaignAdExtension>);
my %CampaignCriterion_of :ATTR(:get<CampaignCriterion>);
my %CampaignLabel_of :ATTR(:get<CampaignLabel>);
my %Campaign_of :ATTR(:get<Campaign>);
my %FeedItem_of :ATTR(:get<FeedItem>);
my %Job_of :ATTR(:get<Job>);
my %Label_of :ATTR(:get<Label>);
my %Media_of :ATTR(:get<Media>);
my %PlaceHolder_of :ATTR(:get<PlaceHolder>);

__PACKAGE__->_factory(
    [ qw(        AdGroupAdLabel
        AdGroupAd
        AdGroupBidModifier
        AdGroupCriterionLabel
        AdGroupCriterion
        AdGroupLabel
        AdGroup
        Ad
        Budget
        CampaignAdExtension
        CampaignCriterion
        CampaignLabel
        Campaign
        FeedItem
        Job
        Label
        Media
        PlaceHolder

    ) ],
    {
        'AdGroupAdLabel' => \%AdGroupAdLabel_of,
        'AdGroupAd' => \%AdGroupAd_of,
        'AdGroupBidModifier' => \%AdGroupBidModifier_of,
        'AdGroupCriterionLabel' => \%AdGroupCriterionLabel_of,
        'AdGroupCriterion' => \%AdGroupCriterion_of,
        'AdGroupLabel' => \%AdGroupLabel_of,
        'AdGroup' => \%AdGroup_of,
        'Ad' => \%Ad_of,
        'Budget' => \%Budget_of,
        'CampaignAdExtension' => \%CampaignAdExtension_of,
        'CampaignCriterion' => \%CampaignCriterion_of,
        'CampaignLabel' => \%CampaignLabel_of,
        'Campaign' => \%Campaign_of,
        'FeedItem' => \%FeedItem_of,
        'Job' => \%Job_of,
        'Label' => \%Label_of,
        'Media' => \%Media_of,
        'PlaceHolder' => \%PlaceHolder_of,
    },
    {
        'AdGroupAdLabel' => 'Google::Ads::AdWords::v201502::AdGroupAdLabel',
        'AdGroupAd' => 'Google::Ads::AdWords::v201502::AdGroupAd',
        'AdGroupBidModifier' => 'Google::Ads::AdWords::v201502::AdGroupBidModifier',
        'AdGroupCriterionLabel' => 'Google::Ads::AdWords::v201502::AdGroupCriterionLabel',
        'AdGroupCriterion' => 'Google::Ads::AdWords::v201502::AdGroupCriterion',
        'AdGroupLabel' => 'Google::Ads::AdWords::v201502::AdGroupLabel',
        'AdGroup' => 'Google::Ads::AdWords::v201502::AdGroup',
        'Ad' => 'Google::Ads::AdWords::v201502::Ad',
        'Budget' => 'Google::Ads::AdWords::v201502::Budget',
        'CampaignAdExtension' => 'Google::Ads::AdWords::v201502::CampaignAdExtension',
        'CampaignCriterion' => 'Google::Ads::AdWords::v201502::CampaignCriterion',
        'CampaignLabel' => 'Google::Ads::AdWords::v201502::CampaignLabel',
        'Campaign' => 'Google::Ads::AdWords::v201502::Campaign',
        'FeedItem' => 'Google::Ads::AdWords::v201502::FeedItem',
        'Job' => 'Google::Ads::AdWords::v201502::Job',
        'Label' => 'Google::Ads::AdWords::v201502::Label',
        'Media' => 'Google::Ads::AdWords::v201502::Media',
        'PlaceHolder' => 'Google::Ads::AdWords::v201502::PlaceHolder',
    },
    {

        'AdGroupAdLabel' => 'AdGroupAdLabel',
        'AdGroupAd' => 'AdGroupAd',
        'AdGroupBidModifier' => 'AdGroupBidModifier',
        'AdGroupCriterionLabel' => 'AdGroupCriterionLabel',
        'AdGroupCriterion' => 'AdGroupCriterion',
        'AdGroupLabel' => 'AdGroupLabel',
        'AdGroup' => 'AdGroup',
        'Ad' => 'Ad',
        'Budget' => 'Budget',
        'CampaignAdExtension' => 'CampaignAdExtension',
        'CampaignCriterion' => 'CampaignCriterion',
        'CampaignLabel' => 'CampaignLabel',
        'Campaign' => 'Campaign',
        'FeedItem' => 'FeedItem',
        'Job' => 'Job',
        'Label' => 'Label',
        'Media' => 'Media',
        'PlaceHolder' => 'PlaceHolder',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201502::Operand

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
Operand from the namespace https://adwords.google.com/api/adwords/cm/v201502.

A marker interface for entities that can be operated upon in mutate operations. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * AdGroupAdLabel


=item * AdGroupAd


=item * AdGroupBidModifier


=item * AdGroupCriterionLabel


=item * AdGroupCriterion


=item * AdGroupLabel


=item * AdGroup


=item * Ad


=item * Budget


=item * CampaignAdExtension


=item * CampaignCriterion


=item * CampaignLabel


=item * Campaign


=item * FeedItem


=item * Job


=item * Label


=item * Media


=item * PlaceHolder




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

