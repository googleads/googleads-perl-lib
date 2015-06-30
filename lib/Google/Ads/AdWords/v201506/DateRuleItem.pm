package Google::Ads::AdWords::v201506::DateRuleItem;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/rm/v201506' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %key_of :ATTR(:get<key>);
my %op_of :ATTR(:get<op>);
my %value_of :ATTR(:get<value>);

__PACKAGE__->_factory(
    [ qw(        key
        op
        value

    ) ],
    {
        'key' => \%key_of,
        'op' => \%op_of,
        'value' => \%value_of,
    },
    {
        'key' => 'Google::Ads::AdWords::v201506::DateKey',
        'op' => 'Google::Ads::AdWords::v201506::DateRuleItem::DateOperator',
        'value' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'key' => 'key',
        'op' => 'op',
        'value' => 'value',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201506::DateRuleItem

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
DateRuleItem from the namespace https://adwords.google.com/api/adwords/rm/v201506.

An atomic rule fragment composing of date operation. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * key


=item * op


=item * value




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
