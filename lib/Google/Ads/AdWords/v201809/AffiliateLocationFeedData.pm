package Google::Ads::AdWords::v201809::AffiliateLocationFeedData;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201809' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201809::SystemFeedGenerationData);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %SystemFeedGenerationData__Type_of :ATTR(:get<SystemFeedGenerationData__Type>);
my %chains_of :ATTR(:get<chains>);
my %relationshipType_of :ATTR(:get<relationshipType>);

__PACKAGE__->_factory(
    [ qw(        SystemFeedGenerationData__Type
        chains
        relationshipType

    ) ],
    {
        'SystemFeedGenerationData__Type' => \%SystemFeedGenerationData__Type_of,
        'chains' => \%chains_of,
        'relationshipType' => \%relationshipType_of,
    },
    {
        'SystemFeedGenerationData__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'chains' => 'Google::Ads::AdWords::v201809::Chain',
        'relationshipType' => 'Google::Ads::AdWords::v201809::RelationshipType',
    },
    {

        'SystemFeedGenerationData__Type' => 'SystemFeedGenerationData.Type',
        'chains' => 'chains',
        'relationshipType' => 'relationshipType',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201809::AffiliateLocationFeedData

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
AffiliateLocationFeedData from the namespace https://adwords.google.com/api/adwords/cm/v201809.

Data used to configure an Affiliate Location Feed populated with the specified chains. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * chains


=item * relationshipType




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
