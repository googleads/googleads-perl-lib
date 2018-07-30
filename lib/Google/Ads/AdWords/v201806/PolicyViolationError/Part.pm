package Google::Ads::AdWords::v201806::PolicyViolationError::Part;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201806' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %index_of :ATTR(:get<index>);
my %length_of :ATTR(:get<length>);

__PACKAGE__->_factory(
    [ qw(        index
        length

    ) ],
    {
        'index' => \%index_of,
        'length' => \%length_of,
    },
    {
        'index' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
        'length' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
    },
    {

        'index' => 'index',
        'length' => 'length',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201806::PolicyViolationError::Part

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
PolicyViolationError.Part from the namespace https://adwords.google.com/api/adwords/cm/v201806.

Points to a substring within an ad field or criterion. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * index


=item * length




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
