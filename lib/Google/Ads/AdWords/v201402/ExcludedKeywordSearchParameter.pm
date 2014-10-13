package Google::Ads::AdWords::v201402::ExcludedKeywordSearchParameter;
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
my %keywords_of :ATTR(:get<keywords>);

__PACKAGE__->_factory(
    [ qw(        SearchParameter__Type
        keywords

    ) ],
    {
        'SearchParameter__Type' => \%SearchParameter__Type_of,
        'keywords' => \%keywords_of,
    },
    {
        'SearchParameter__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'keywords' => 'Google::Ads::AdWords::v201402::Keyword',
    },
    {

        'SearchParameter__Type' => 'SearchParameter.Type',
        'keywords' => 'keywords',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201402::ExcludedKeywordSearchParameter

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
ExcludedKeywordSearchParameter from the namespace https://adwords.google.com/api/adwords/o/v201402.

A {@link SearchParameter} for {@code KEYWORD} {@link IdeaType}s that specifies {@link Keyword}s that should be excluded from the results.<p> The {@link KeywordMatchType} associated with these keywords is used to provide various filtering strategies. For example, the excluded keyword <b>"brand x player"</b> will exclude ideas from the resulting ideas as described by the table below. <table border="1"> <tr style="font-weight: bold;"> <th>Idea</th> <th>{@code BROAD}</th> <th>{@code PHRASE}</th> <th>{@code EXACT}</th> </tr> <tr> <td>brand x player</td> <td>Exclude</td> <td>Exclude</td> <td>Exclude</td> </tr> <tr> <td>blu-ray brand x player</td> <td>Exclude</td> <td>Exclude</td> <td>Include</td> </tr> <tr> <td>brand x dvd player</td> <td>Exclude</td> <td>Include</td> <td>Include</td> </tr> <tr> <td>brand x dvd</td> <td>Include</td> <td>Include</td> <td>Include</td> </tr> </table> <p>This element is supported by following {@link IdeaType}s: KEYWORD. <p>This element is supported by following {@link RequestType}s: IDEAS, STATS. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * keywords




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
