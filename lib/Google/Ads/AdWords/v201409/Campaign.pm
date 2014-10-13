package Google::Ads::AdWords::v201409::Campaign;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201409' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %id_of :ATTR(:get<id>);
my %name_of :ATTR(:get<name>);
my %status_of :ATTR(:get<status>);
my %servingStatus_of :ATTR(:get<servingStatus>);
my %startDate_of :ATTR(:get<startDate>);
my %endDate_of :ATTR(:get<endDate>);
my %budget_of :ATTR(:get<budget>);
my %conversionOptimizerEligibility_of :ATTR(:get<conversionOptimizerEligibility>);
my %adServingOptimizationStatus_of :ATTR(:get<adServingOptimizationStatus>);
my %frequencyCap_of :ATTR(:get<frequencyCap>);
my %settings_of :ATTR(:get<settings>);
my %advertisingChannelType_of :ATTR(:get<advertisingChannelType>);
my %advertisingChannelSubType_of :ATTR(:get<advertisingChannelSubType>);
my %networkSetting_of :ATTR(:get<networkSetting>);
my %labels_of :ATTR(:get<labels>);
my %biddingStrategyConfiguration_of :ATTR(:get<biddingStrategyConfiguration>);
my %forwardCompatibilityMap_of :ATTR(:get<forwardCompatibilityMap>);
my %trackingUrlTemplate_of :ATTR(:get<trackingUrlTemplate>);
my %urlCustomParameters_of :ATTR(:get<urlCustomParameters>);

__PACKAGE__->_factory(
    [ qw(        id
        name
        status
        servingStatus
        startDate
        endDate
        budget
        conversionOptimizerEligibility
        adServingOptimizationStatus
        frequencyCap
        settings
        advertisingChannelType
        advertisingChannelSubType
        networkSetting
        labels
        biddingStrategyConfiguration
        forwardCompatibilityMap
        trackingUrlTemplate
        urlCustomParameters

    ) ],
    {
        'id' => \%id_of,
        'name' => \%name_of,
        'status' => \%status_of,
        'servingStatus' => \%servingStatus_of,
        'startDate' => \%startDate_of,
        'endDate' => \%endDate_of,
        'budget' => \%budget_of,
        'conversionOptimizerEligibility' => \%conversionOptimizerEligibility_of,
        'adServingOptimizationStatus' => \%adServingOptimizationStatus_of,
        'frequencyCap' => \%frequencyCap_of,
        'settings' => \%settings_of,
        'advertisingChannelType' => \%advertisingChannelType_of,
        'advertisingChannelSubType' => \%advertisingChannelSubType_of,
        'networkSetting' => \%networkSetting_of,
        'labels' => \%labels_of,
        'biddingStrategyConfiguration' => \%biddingStrategyConfiguration_of,
        'forwardCompatibilityMap' => \%forwardCompatibilityMap_of,
        'trackingUrlTemplate' => \%trackingUrlTemplate_of,
        'urlCustomParameters' => \%urlCustomParameters_of,
    },
    {
        'id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'name' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'status' => 'Google::Ads::AdWords::v201409::CampaignStatus',
        'servingStatus' => 'Google::Ads::AdWords::v201409::ServingStatus',
        'startDate' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'endDate' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'budget' => 'Google::Ads::AdWords::v201409::Budget',
        'conversionOptimizerEligibility' => 'Google::Ads::AdWords::v201409::ConversionOptimizerEligibility',
        'adServingOptimizationStatus' => 'Google::Ads::AdWords::v201409::AdServingOptimizationStatus',
        'frequencyCap' => 'Google::Ads::AdWords::v201409::FrequencyCap',
        'settings' => 'Google::Ads::AdWords::v201409::Setting',
        'advertisingChannelType' => 'Google::Ads::AdWords::v201409::AdvertisingChannelType',
        'advertisingChannelSubType' => 'Google::Ads::AdWords::v201409::AdvertisingChannelSubType',
        'networkSetting' => 'Google::Ads::AdWords::v201409::NetworkSetting',
        'labels' => 'Google::Ads::AdWords::v201409::Label',
        'biddingStrategyConfiguration' => 'Google::Ads::AdWords::v201409::BiddingStrategyConfiguration',
        'forwardCompatibilityMap' => 'Google::Ads::AdWords::v201409::String_StringMapEntry',
        'trackingUrlTemplate' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'urlCustomParameters' => 'Google::Ads::AdWords::v201409::CustomParameters',
    },
    {

        'id' => 'id',
        'name' => 'name',
        'status' => 'status',
        'servingStatus' => 'servingStatus',
        'startDate' => 'startDate',
        'endDate' => 'endDate',
        'budget' => 'budget',
        'conversionOptimizerEligibility' => 'conversionOptimizerEligibility',
        'adServingOptimizationStatus' => 'adServingOptimizationStatus',
        'frequencyCap' => 'frequencyCap',
        'settings' => 'settings',
        'advertisingChannelType' => 'advertisingChannelType',
        'advertisingChannelSubType' => 'advertisingChannelSubType',
        'networkSetting' => 'networkSetting',
        'labels' => 'labels',
        'biddingStrategyConfiguration' => 'biddingStrategyConfiguration',
        'forwardCompatibilityMap' => 'forwardCompatibilityMap',
        'trackingUrlTemplate' => 'trackingUrlTemplate',
        'urlCustomParameters' => 'urlCustomParameters',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201409::Campaign

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
Campaign from the namespace https://adwords.google.com/api/adwords/cm/v201409.

Data representing an AdWords campaign. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * id


=item * name


=item * status


=item * servingStatus


=item * startDate


=item * endDate


=item * budget


=item * conversionOptimizerEligibility


=item * adServingOptimizationStatus


=item * frequencyCap


=item * settings


=item * advertisingChannelType


=item * advertisingChannelSubType


=item * networkSetting


=item * labels


=item * biddingStrategyConfiguration


=item * forwardCompatibilityMap


=item * trackingUrlTemplate


=item * urlCustomParameters




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

