package Google::Ads::AdWords::v201607::ConversionOptimizerBiddingScheme;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201607' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201607::BiddingScheme);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %BiddingScheme__Type_of :ATTR(:get<BiddingScheme__Type>);
my %pricingMode_of :ATTR(:get<pricingMode>);
my %bidType_of :ATTR(:get<bidType>);

__PACKAGE__->_factory(
    [ qw(        BiddingScheme__Type
        pricingMode
        bidType

    ) ],
    {
        'BiddingScheme__Type' => \%BiddingScheme__Type_of,
        'pricingMode' => \%pricingMode_of,
        'bidType' => \%bidType_of,
    },
    {
        'BiddingScheme__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'pricingMode' => 'Google::Ads::AdWords::v201607::ConversionOptimizerBiddingScheme::PricingMode',
        'bidType' => 'Google::Ads::AdWords::v201607::ConversionOptimizerBiddingScheme::BidType',
    },
    {

        'BiddingScheme__Type' => 'BiddingScheme.Type',
        'pricingMode' => 'pricingMode',
        'bidType' => 'bidType',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201607::ConversionOptimizerBiddingScheme

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
ConversionOptimizerBiddingScheme from the namespace https://adwords.google.com/api/adwords/cm/v201607.

This bidding strategy has been deprecated and replaced with {@linkplain TargetCpaBiddingScheme TargetCpa}. After V201601, we no longer allow advertisers to opt into this strategy--{@code ConversionOptimizerBiddingScheme} solely exists so that advertisers can access campaigns that had specified this strategy.</p> <p>Conversion optimizer bidding strategy helps you maximize your return on investment (ROI) by automatically getting you the most possible conversions for your budget. <p class="warning">{@code pricingMode} currently defaults to {@code CLICKS} and cannot be changed.</p> <p>Note that campaigns must meet <a href="https://support.google.com/adwords/answer/2471188#CORequirements"> specific eligibility requirements</a> before they can use the <code>ConversionOptimizer</code> bidding strategy.</p> <p>For more information on conversion optimizer, visit the <a href="https://support.google.com/adwords/answer/2390684" >Conversion Optimizer help center</a>.</p> <span class="constraint AdxEnabled">This is disabled for AdX.</span> 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * pricingMode


=item * bidType




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

