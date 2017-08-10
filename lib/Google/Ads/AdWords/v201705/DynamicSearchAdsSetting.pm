package Google::Ads::AdWords::v201705::DynamicSearchAdsSetting;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201705' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201705::Setting);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %Setting__Type_of :ATTR(:get<Setting__Type>);
my %domainName_of :ATTR(:get<domainName>);
my %languageCode_of :ATTR(:get<languageCode>);
my %useSuppliedUrlsOnly_of :ATTR(:get<useSuppliedUrlsOnly>);
my %pageFeed_of :ATTR(:get<pageFeed>);

__PACKAGE__->_factory(
    [ qw(        Setting__Type
        domainName
        languageCode
        useSuppliedUrlsOnly
        pageFeed

    ) ],
    {
        'Setting__Type' => \%Setting__Type_of,
        'domainName' => \%domainName_of,
        'languageCode' => \%languageCode_of,
        'useSuppliedUrlsOnly' => \%useSuppliedUrlsOnly_of,
        'pageFeed' => \%pageFeed_of,
    },
    {
        'Setting__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'domainName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'languageCode' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'useSuppliedUrlsOnly' => 'SOAP::WSDL::XSD::Typelib::Builtin::boolean',
        'pageFeed' => 'Google::Ads::AdWords::v201705::PageFeed',
    },
    {

        'Setting__Type' => 'Setting.Type',
        'domainName' => 'domainName',
        'languageCode' => 'languageCode',
        'useSuppliedUrlsOnly' => 'useSuppliedUrlsOnly',
        'pageFeed' => 'pageFeed',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201705::DynamicSearchAdsSetting

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
DynamicSearchAdsSetting from the namespace https://adwords.google.com/api/adwords/cm/v201705.

Setting for controlling Dynamic Search Ads (DSA). Contains the domain name and the language used by the DSA system to automatically generate landing pages and keywords for a campaign. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * domainName


=item * languageCode


=item * useSuppliedUrlsOnly


=item * pageFeed




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
