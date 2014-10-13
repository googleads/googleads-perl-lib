package Google::Ads::AdWords::v201402::PlacementTypeSearchParameter;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/o/v201402' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201402::SearchParameter);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %SearchParameter__Type_of :ATTR(:get<SearchParameter__Type>);
my %placementTypes_of :ATTR(:get<placementTypes>);

__PACKAGE__->_factory(
    [ qw(        SearchParameter__Type
        placementTypes

    ) ],
    {
        'SearchParameter__Type' => \%SearchParameter__Type_of,
        'placementTypes' => \%placementTypes_of,
    },
    {
        'SearchParameter__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'placementTypes' => 'Google::Ads::AdWords::v201402::SiteConstants::PlacementType',
    },
    {

        'SearchParameter__Type' => 'SearchParameter.Type',
        'placementTypes' => 'placementTypes',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201402::PlacementTypeSearchParameter

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
PlacementTypeSearchParameter from the namespace https://adwords.google.com/api/adwords/o/v201402.

A {@link SearchParameter} for {@code PLACEMENT} {@link IdeaType}s used to filter results based on the type of website, known as {@link com.google.ads.api.services.targetingideas.attributes.Type#PLACEMENT_TYPE}, that they appear in. For example, searches may be limited to find results that only appear within mobile websites or feeds. <p>This element is supported by following {@link IdeaType}s: PLACEMENT. <p>This element is supported by following {@link RequestType}s: IDEAS. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * placementTypes




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
