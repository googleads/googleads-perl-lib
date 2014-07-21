package Google::Ads::AdWords::v201406::DynamicSearchAd;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201406' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201406::Ad);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %id_of :ATTR(:get<id>);
my %url_of :ATTR(:get<url>);
my %displayUrl_of :ATTR(:get<displayUrl>);
my %finalUrls_of :ATTR(:get<finalUrls>);
my %finalMobileUrls_of :ATTR(:get<finalMobileUrls>);
my %trackingUrlTemplate_of :ATTR(:get<trackingUrlTemplate>);
my %urlCustomParameters_of :ATTR(:get<urlCustomParameters>);
my %devicePreference_of :ATTR(:get<devicePreference>);
my %Ad__Type_of :ATTR(:get<Ad__Type>);
my %description1_of :ATTR(:get<description1>);
my %description2_of :ATTR(:get<description2>);

__PACKAGE__->_factory(
    [ qw(        id
        url
        displayUrl
        finalUrls
        finalMobileUrls
        trackingUrlTemplate
        urlCustomParameters
        devicePreference
        Ad__Type
        description1
        description2

    ) ],
    {
        'id' => \%id_of,
        'url' => \%url_of,
        'displayUrl' => \%displayUrl_of,
        'finalUrls' => \%finalUrls_of,
        'finalMobileUrls' => \%finalMobileUrls_of,
        'trackingUrlTemplate' => \%trackingUrlTemplate_of,
        'urlCustomParameters' => \%urlCustomParameters_of,
        'devicePreference' => \%devicePreference_of,
        'Ad__Type' => \%Ad__Type_of,
        'description1' => \%description1_of,
        'description2' => \%description2_of,
    },
    {
        'id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'displayUrl' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'finalUrls' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'finalMobileUrls' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'trackingUrlTemplate' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'urlCustomParameters' => 'Google::Ads::AdWords::v201406::CustomParameters',
        'devicePreference' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'Ad__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'description1' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'description2' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'id' => 'id',
        'url' => 'url',
        'displayUrl' => 'displayUrl',
        'finalUrls' => 'finalUrls',
        'finalMobileUrls' => 'finalMobileUrls',
        'trackingUrlTemplate' => 'trackingUrlTemplate',
        'urlCustomParameters' => 'urlCustomParameters',
        'devicePreference' => 'devicePreference',
        'Ad__Type' => 'Ad.Type',
        'description1' => 'description1',
        'description2' => 'description2',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201406::DynamicSearchAd

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
DynamicSearchAd from the namespace https://adwords.google.com/api/adwords/cm/v201406.

Represents a dynamic search ad. This ad will have its headline and destination URL auto-generated at serving time according to domain name specific information provided by {@link DomainInfoExtension} linked at the campaign level. <p>Auto-generated fields: headline and destination URL (may contain an optional tracking URL).</p> <p><b>Required fields:</b> {@code description1}, {@code description2}, {@code displayUrl}.</p> <p>The URL field must contain at least one of the following placeholder tags (URL parameters):</p> <ul> <li>{unescapedlpurl}</li> <li>{escapedlpurl}</li> <li>{lpurlpath}</li> <li>{lpurl}</li> </ul> <p>If no URL is specified, {unescapedlpurl} will be used as default.</p> <ul> <li>{unescapedlpurl} can only be used at the beginning of the URL field. It will be replaced with the full landing page URL of the displayed ad. Extra query parameters can be added to the end, e.g.: "{unescapedlpurl}?lang=en".</li> <li>{escapedlpurl} will be replaced with the URL-encoded version of the full landing page URL. This makes it suitable for use as a query parameter value (e.g.: "http://www.3rdpartytracker.com/?lp={escapedlpurl}") but not at the beginning of the URL field.</li> <li>{lpurlpath} will be replaced with the path and query part of the landing page URL and can be added to a different URL, e.g.: "http://www.mygoodbusiness.com/tracking/{lpurlpath}".</li> <li>{lpurl} encodes the "?" and "=" of the landing page URL making it suitable for use as a query parameter. If found at the beginning of the URL field, it is replaced by the {unescapedlpurl} value. E.g.: "http://tracking.com/redir.php?tracking=xyz&url={lpurl}".</li> </ul> <p>There are also special rules that come into play depending on whether the destination URL uses local click tracking or third-party click tracking.</p> <p>For more information, see the article <a href="//support.google.com/adwords/answer/2549100">Using dynamic tracking URLs</a>. </p> <span class="constraint AdxEnabled">This is disabled for AdX when it is contained within Operators: ADD, SET.</span> 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * description1


=item * description2




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

