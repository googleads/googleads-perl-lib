package Google::Ads::AdWords::v201705::AdSchedule;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201705' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(Google::Ads::AdWords::v201705::Criterion);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %id_of :ATTR(:get<id>);
my %type_of :ATTR(:get<type>);
my %Criterion__Type_of :ATTR(:get<Criterion__Type>);
my %dayOfWeek_of :ATTR(:get<dayOfWeek>);
my %startHour_of :ATTR(:get<startHour>);
my %startMinute_of :ATTR(:get<startMinute>);
my %endHour_of :ATTR(:get<endHour>);
my %endMinute_of :ATTR(:get<endMinute>);

__PACKAGE__->_factory(
    [ qw(        id
        type
        Criterion__Type
        dayOfWeek
        startHour
        startMinute
        endHour
        endMinute

    ) ],
    {
        'id' => \%id_of,
        'type' => \%type_of,
        'Criterion__Type' => \%Criterion__Type_of,
        'dayOfWeek' => \%dayOfWeek_of,
        'startHour' => \%startHour_of,
        'startMinute' => \%startMinute_of,
        'endHour' => \%endHour_of,
        'endMinute' => \%endMinute_of,
    },
    {
        'id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
        'type' => 'Google::Ads::AdWords::v201705::Criterion::Type',
        'Criterion__Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'dayOfWeek' => 'Google::Ads::AdWords::v201705::DayOfWeek',
        'startHour' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
        'startMinute' => 'Google::Ads::AdWords::v201705::MinuteOfHour',
        'endHour' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
        'endMinute' => 'Google::Ads::AdWords::v201705::MinuteOfHour',
    },
    {

        'id' => 'id',
        'type' => 'type',
        'Criterion__Type' => 'Criterion.Type',
        'dayOfWeek' => 'dayOfWeek',
        'startHour' => 'startHour',
        'startMinute' => 'startMinute',
        'endHour' => 'endHour',
        'endMinute' => 'endMinute',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201705::AdSchedule

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
AdSchedule from the namespace https://adwords.google.com/api/adwords/cm/v201705.

Represents an AdSchedule Criterion. AdSchedule is specified as day and time of the week criteria to target the Ads. <p><b>Note:</b> An AdSchedule may not have more than <b>six</b> intervals in a day.</p> <span class="constraint AdxEnabled">This is enabled for AdX.</span> 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * dayOfWeek


=item * startHour


=item * startMinute


=item * endHour


=item * endMinute




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut
