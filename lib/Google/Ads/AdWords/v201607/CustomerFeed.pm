package Google::Ads::AdWords::v201607::CustomerFeed;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201607' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %feedId_of :ATTR(:get<feedId>);
my %matchingFunction_of :ATTR(:get<matchingFunction>);
my %placeholderTypes_of :ATTR(:get<placeholderTypes>);
my %status_of :ATTR(:get<status>);

__PACKAGE__->_factory(
    [ qw(        feedId
        matchingFunction
        placeholderTypes
        status

    ) ],
    {
        'feedId' => \%feedId_of,
        'matchingFunction' => \%matchingFunction_of,
        'placeholderTypes' => \%placeholderTypes_of,
        'status' => \%status_of,
    },
    {
        'feedId' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'matchingFunction' => 'Google::Ads::AdWords::v201607::Function',
        'placeholderTypes' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
        'status' => 'Google::Ads::AdWords::v201607::CustomerFeed::Status',
    },
    {

        'feedId' => 'feedId',
        'matchingFunction' => 'matchingFunction',
        'placeholderTypes' => 'placeholderTypes',
        'status' => 'status',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201607::CustomerFeed

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
CustomerFeed from the namespace https://adwords.google.com/api/adwords/cm/v201607.

CustomerFeeds are used to link a feed to the customer using a matching function, making the feed's feed items available in the customer's ads for substitution. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * feedId


=item * matchingFunction


=item * placeholderTypes


=item * status




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

