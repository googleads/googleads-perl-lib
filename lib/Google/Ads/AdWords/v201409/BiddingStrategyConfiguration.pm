package Google::Ads::AdWords::v201409::BiddingStrategyConfiguration;
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

my %biddingStrategyId_of :ATTR(:get<biddingStrategyId>);
my %biddingStrategyName_of :ATTR(:get<biddingStrategyName>);
my %biddingStrategyType_of :ATTR(:get<biddingStrategyType>);
my %biddingStrategySource_of :ATTR(:get<biddingStrategySource>);
my %biddingScheme_of :ATTR(:get<biddingScheme>);
my %bids_of :ATTR(:get<bids>);

__PACKAGE__->_factory(
    [ qw(        biddingStrategyId
        biddingStrategyName
        biddingStrategyType
        biddingStrategySource
        biddingScheme
        bids

    ) ],
    {
        'biddingStrategyId' => \%biddingStrategyId_of,
        'biddingStrategyName' => \%biddingStrategyName_of,
        'biddingStrategyType' => \%biddingStrategyType_of,
        'biddingStrategySource' => \%biddingStrategySource_of,
        'biddingScheme' => \%biddingScheme_of,
        'bids' => \%bids_of,
    },
    {
        'biddingStrategyId' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'biddingStrategyName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'biddingStrategyType' => 'Google::Ads::AdWords::v201409::BiddingStrategyType',
        'biddingStrategySource' => 'Google::Ads::AdWords::v201409::BiddingStrategySource',
        'biddingScheme' => 'Google::Ads::AdWords::v201409::BiddingScheme',
        'bids' => 'Google::Ads::AdWords::v201409::Bids',
    },
    {

        'biddingStrategyId' => 'biddingStrategyId',
        'biddingStrategyName' => 'biddingStrategyName',
        'biddingStrategyType' => 'biddingStrategyType',
        'biddingStrategySource' => 'biddingStrategySource',
        'biddingScheme' => 'biddingScheme',
        'bids' => 'bids',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201409::BiddingStrategyConfiguration

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
BiddingStrategyConfiguration from the namespace https://adwords.google.com/api/adwords/cm/v201409.

Encapsulates the information about bids and bidding strategies. Bidding Strategy can be set on campaigns, ad groups or ad group criteria. A bidding strategy can be set using one of the following: <ul> <li>{@linkplain BiddingStrategyConfiguration#biddingScheme bidding scheme}</li> <li>{@linkplain BiddingStrategyConfiguration#biddingStrategyType bidding strategy type}</li> <li>{@linkplain BiddingStrategyConfiguration#biddingStrategyId bidding strategy ID} for flexible bid strategies.</li> </ul> If the bidding strategy type is used, then schemes are created using default values. Bids can be set only on ad groups and ad group criteria. They cannot be set on campaigns. Multiple bids can be set at the same time. Only the bids that apply to the campaign's {@linkplain Campaign#biddingStrategyConfiguration bidding strategy} will be used. For more information on flexible bidding, visit the <a href="https://support.google.com/adwords/answer/2979071">Help Center</a>. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * biddingStrategyId


=item * biddingStrategyName


=item * biddingStrategyType


=item * biddingStrategySource


=item * biddingScheme


=item * bids




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
