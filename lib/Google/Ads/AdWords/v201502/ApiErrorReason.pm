package Google::Ads::AdWords::v201502::ApiErrorReason;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'https://adwords.google.com/api/adwords/cm/v201502' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(Google::Ads::SOAP::Typelib::ComplexType);

{ # BLOCK to scope variables

my %AdCustomizerErrorReason_of :ATTR(:get<AdCustomizerErrorReason>);
my %AdErrorReason_of :ATTR(:get<AdErrorReason>);
my %AdExtensionErrorReason_of :ATTR(:get<AdExtensionErrorReason>);
my %AdGroupAdErrorReason_of :ATTR(:get<AdGroupAdErrorReason>);
my %AdGroupCriterionErrorReason_of :ATTR(:get<AdGroupCriterionErrorReason>);
my %AdGroupServiceErrorReason_of :ATTR(:get<AdGroupServiceErrorReason>);
my %AdxErrorReason_of :ATTR(:get<AdxErrorReason>);
my %AuthenticationErrorReason_of :ATTR(:get<AuthenticationErrorReason>);
my %AuthorizationErrorReason_of :ATTR(:get<AuthorizationErrorReason>);
my %BetaErrorReason_of :ATTR(:get<BetaErrorReason>);
my %BiddingErrorReason_of :ATTR(:get<BiddingErrorReason>);
my %BiddingErrorsReason_of :ATTR(:get<BiddingErrorsReason>);
my %BiddingTransitionErrorReason_of :ATTR(:get<BiddingTransitionErrorReason>);
my %BudgetErrorReason_of :ATTR(:get<BudgetErrorReason>);
my %BulkMutateJobErrorReason_of :ATTR(:get<BulkMutateJobErrorReason>);
my %CampaignAdExtensionErrorReason_of :ATTR(:get<CampaignAdExtensionErrorReason>);
my %CampaignCriterionErrorReason_of :ATTR(:get<CampaignCriterionErrorReason>);
my %CampaignErrorReason_of :ATTR(:get<CampaignErrorReason>);
my %ClientTermsErrorReason_of :ATTR(:get<ClientTermsErrorReason>);
my %CollectionSizeErrorReason_of :ATTR(:get<CollectionSizeErrorReason>);
my %CriterionErrorReason_of :ATTR(:get<CriterionErrorReason>);
my %DatabaseErrorReason_of :ATTR(:get<DatabaseErrorReason>);
my %DateErrorReason_of :ATTR(:get<DateErrorReason>);
my %DateRangeErrorReason_of :ATTR(:get<DateRangeErrorReason>);
my %DistinctErrorReason_of :ATTR(:get<DistinctErrorReason>);
my %EntityAccessDeniedReason_of :ATTR(:get<EntityAccessDeniedReason>);
my %EntityCountLimitExceededReason_of :ATTR(:get<EntityCountLimitExceededReason>);
my %EntityNotFoundReason_of :ATTR(:get<EntityNotFoundReason>);
my %ExperimentErrorReason_of :ATTR(:get<ExperimentErrorReason>);
my %FeedAttributeReferenceErrorReason_of :ATTR(:get<FeedAttributeReferenceErrorReason>);
my %FeedItemErrorReason_of :ATTR(:get<FeedItemErrorReason>);
my %ForwardCompatibilityErrorReason_of :ATTR(:get<ForwardCompatibilityErrorReason>);
my %FunctionErrorReason_of :ATTR(:get<FunctionErrorReason>);
my %FunctionParsingErrorReason_of :ATTR(:get<FunctionParsingErrorReason>);
my %IdErrorReason_of :ATTR(:get<IdErrorReason>);
my %ImageErrorReason_of :ATTR(:get<ImageErrorReason>);
my %InternalApiErrorReason_of :ATTR(:get<InternalApiErrorReason>);
my %JobErrorReason_of :ATTR(:get<JobErrorReason>);
my %MediaErrorReason_of :ATTR(:get<MediaErrorReason>);
my %MultiplierErrorReason_of :ATTR(:get<MultiplierErrorReason>);
my %NewEntityCreationErrorReason_of :ATTR(:get<NewEntityCreationErrorReason>);
my %NotEmptyErrorReason_of :ATTR(:get<NotEmptyErrorReason>);
my %NullErrorReason_of :ATTR(:get<NullErrorReason>);
my %OperationAccessDeniedReason_of :ATTR(:get<OperationAccessDeniedReason>);
my %OperatorErrorReason_of :ATTR(:get<OperatorErrorReason>);
my %PagingErrorReason_of :ATTR(:get<PagingErrorReason>);
my %PolicyViolationErrorReason_of :ATTR(:get<PolicyViolationErrorReason>);
my %QueryErrorReason_of :ATTR(:get<QueryErrorReason>);
my %QuotaCheckErrorReason_of :ATTR(:get<QuotaCheckErrorReason>);
my %RangeErrorReason_of :ATTR(:get<RangeErrorReason>);
my %RateExceededErrorReason_of :ATTR(:get<RateExceededErrorReason>);
my %ReadOnlyErrorReason_of :ATTR(:get<ReadOnlyErrorReason>);
my %RegionCodeErrorReason_of :ATTR(:get<RegionCodeErrorReason>);
my %RejectedErrorReason_of :ATTR(:get<RejectedErrorReason>);
my %RequestErrorReason_of :ATTR(:get<RequestErrorReason>);
my %RequiredErrorReason_of :ATTR(:get<RequiredErrorReason>);
my %SelectorErrorReason_of :ATTR(:get<SelectorErrorReason>);
my %SettingErrorReason_of :ATTR(:get<SettingErrorReason>);
my %SizeLimitErrorReason_of :ATTR(:get<SizeLimitErrorReason>);
my %StatsQueryErrorReason_of :ATTR(:get<StatsQueryErrorReason>);
my %StringFormatErrorReason_of :ATTR(:get<StringFormatErrorReason>);
my %StringLengthErrorReason_of :ATTR(:get<StringLengthErrorReason>);
my %UrlErrorReason_of :ATTR(:get<UrlErrorReason>);

__PACKAGE__->_factory(
    [ qw(        AdCustomizerErrorReason
        AdErrorReason
        AdExtensionErrorReason
        AdGroupAdErrorReason
        AdGroupCriterionErrorReason
        AdGroupServiceErrorReason
        AdxErrorReason
        AuthenticationErrorReason
        AuthorizationErrorReason
        BetaErrorReason
        BiddingErrorReason
        BiddingErrorsReason
        BiddingTransitionErrorReason
        BudgetErrorReason
        BulkMutateJobErrorReason
        CampaignAdExtensionErrorReason
        CampaignCriterionErrorReason
        CampaignErrorReason
        ClientTermsErrorReason
        CollectionSizeErrorReason
        CriterionErrorReason
        DatabaseErrorReason
        DateErrorReason
        DateRangeErrorReason
        DistinctErrorReason
        EntityAccessDeniedReason
        EntityCountLimitExceededReason
        EntityNotFoundReason
        ExperimentErrorReason
        FeedAttributeReferenceErrorReason
        FeedItemErrorReason
        ForwardCompatibilityErrorReason
        FunctionErrorReason
        FunctionParsingErrorReason
        IdErrorReason
        ImageErrorReason
        InternalApiErrorReason
        JobErrorReason
        MediaErrorReason
        MultiplierErrorReason
        NewEntityCreationErrorReason
        NotEmptyErrorReason
        NullErrorReason
        OperationAccessDeniedReason
        OperatorErrorReason
        PagingErrorReason
        PolicyViolationErrorReason
        QueryErrorReason
        QuotaCheckErrorReason
        RangeErrorReason
        RateExceededErrorReason
        ReadOnlyErrorReason
        RegionCodeErrorReason
        RejectedErrorReason
        RequestErrorReason
        RequiredErrorReason
        SelectorErrorReason
        SettingErrorReason
        SizeLimitErrorReason
        StatsQueryErrorReason
        StringFormatErrorReason
        StringLengthErrorReason
        UrlErrorReason

    ) ],
    {
        'AdCustomizerErrorReason' => \%AdCustomizerErrorReason_of,
        'AdErrorReason' => \%AdErrorReason_of,
        'AdExtensionErrorReason' => \%AdExtensionErrorReason_of,
        'AdGroupAdErrorReason' => \%AdGroupAdErrorReason_of,
        'AdGroupCriterionErrorReason' => \%AdGroupCriterionErrorReason_of,
        'AdGroupServiceErrorReason' => \%AdGroupServiceErrorReason_of,
        'AdxErrorReason' => \%AdxErrorReason_of,
        'AuthenticationErrorReason' => \%AuthenticationErrorReason_of,
        'AuthorizationErrorReason' => \%AuthorizationErrorReason_of,
        'BetaErrorReason' => \%BetaErrorReason_of,
        'BiddingErrorReason' => \%BiddingErrorReason_of,
        'BiddingErrorsReason' => \%BiddingErrorsReason_of,
        'BiddingTransitionErrorReason' => \%BiddingTransitionErrorReason_of,
        'BudgetErrorReason' => \%BudgetErrorReason_of,
        'BulkMutateJobErrorReason' => \%BulkMutateJobErrorReason_of,
        'CampaignAdExtensionErrorReason' => \%CampaignAdExtensionErrorReason_of,
        'CampaignCriterionErrorReason' => \%CampaignCriterionErrorReason_of,
        'CampaignErrorReason' => \%CampaignErrorReason_of,
        'ClientTermsErrorReason' => \%ClientTermsErrorReason_of,
        'CollectionSizeErrorReason' => \%CollectionSizeErrorReason_of,
        'CriterionErrorReason' => \%CriterionErrorReason_of,
        'DatabaseErrorReason' => \%DatabaseErrorReason_of,
        'DateErrorReason' => \%DateErrorReason_of,
        'DateRangeErrorReason' => \%DateRangeErrorReason_of,
        'DistinctErrorReason' => \%DistinctErrorReason_of,
        'EntityAccessDeniedReason' => \%EntityAccessDeniedReason_of,
        'EntityCountLimitExceededReason' => \%EntityCountLimitExceededReason_of,
        'EntityNotFoundReason' => \%EntityNotFoundReason_of,
        'ExperimentErrorReason' => \%ExperimentErrorReason_of,
        'FeedAttributeReferenceErrorReason' => \%FeedAttributeReferenceErrorReason_of,
        'FeedItemErrorReason' => \%FeedItemErrorReason_of,
        'ForwardCompatibilityErrorReason' => \%ForwardCompatibilityErrorReason_of,
        'FunctionErrorReason' => \%FunctionErrorReason_of,
        'FunctionParsingErrorReason' => \%FunctionParsingErrorReason_of,
        'IdErrorReason' => \%IdErrorReason_of,
        'ImageErrorReason' => \%ImageErrorReason_of,
        'InternalApiErrorReason' => \%InternalApiErrorReason_of,
        'JobErrorReason' => \%JobErrorReason_of,
        'MediaErrorReason' => \%MediaErrorReason_of,
        'MultiplierErrorReason' => \%MultiplierErrorReason_of,
        'NewEntityCreationErrorReason' => \%NewEntityCreationErrorReason_of,
        'NotEmptyErrorReason' => \%NotEmptyErrorReason_of,
        'NullErrorReason' => \%NullErrorReason_of,
        'OperationAccessDeniedReason' => \%OperationAccessDeniedReason_of,
        'OperatorErrorReason' => \%OperatorErrorReason_of,
        'PagingErrorReason' => \%PagingErrorReason_of,
        'PolicyViolationErrorReason' => \%PolicyViolationErrorReason_of,
        'QueryErrorReason' => \%QueryErrorReason_of,
        'QuotaCheckErrorReason' => \%QuotaCheckErrorReason_of,
        'RangeErrorReason' => \%RangeErrorReason_of,
        'RateExceededErrorReason' => \%RateExceededErrorReason_of,
        'ReadOnlyErrorReason' => \%ReadOnlyErrorReason_of,
        'RegionCodeErrorReason' => \%RegionCodeErrorReason_of,
        'RejectedErrorReason' => \%RejectedErrorReason_of,
        'RequestErrorReason' => \%RequestErrorReason_of,
        'RequiredErrorReason' => \%RequiredErrorReason_of,
        'SelectorErrorReason' => \%SelectorErrorReason_of,
        'SettingErrorReason' => \%SettingErrorReason_of,
        'SizeLimitErrorReason' => \%SizeLimitErrorReason_of,
        'StatsQueryErrorReason' => \%StatsQueryErrorReason_of,
        'StringFormatErrorReason' => \%StringFormatErrorReason_of,
        'StringLengthErrorReason' => \%StringLengthErrorReason_of,
        'UrlErrorReason' => \%UrlErrorReason_of,
    },
    {
        'AdCustomizerErrorReason' => 'Google::Ads::AdWords::v201502::AdCustomizerError::Reason',
        'AdErrorReason' => 'Google::Ads::AdWords::v201502::AdError::Reason',
        'AdExtensionErrorReason' => 'Google::Ads::AdWords::v201502::AdExtensionError::Reason',
        'AdGroupAdErrorReason' => 'Google::Ads::AdWords::v201502::AdGroupAdError::Reason',
        'AdGroupCriterionErrorReason' => 'Google::Ads::AdWords::v201502::AdGroupCriterionError::Reason',
        'AdGroupServiceErrorReason' => 'Google::Ads::AdWords::v201502::AdGroupServiceError::Reason',
        'AdxErrorReason' => 'Google::Ads::AdWords::v201502::AdxError::Reason',
        'AuthenticationErrorReason' => 'Google::Ads::AdWords::v201502::AuthenticationError::Reason',
        'AuthorizationErrorReason' => 'Google::Ads::AdWords::v201502::AuthorizationError::Reason',
        'BetaErrorReason' => 'Google::Ads::AdWords::v201502::BetaError::Reason',
        'BiddingErrorReason' => 'Google::Ads::AdWords::v201502::BiddingError::Reason',
        'BiddingErrorsReason' => 'Google::Ads::AdWords::v201502::BiddingErrors::Reason',
        'BiddingTransitionErrorReason' => 'Google::Ads::AdWords::v201502::BiddingTransitionError::Reason',
        'BudgetErrorReason' => 'Google::Ads::AdWords::v201502::BudgetError::Reason',
        'BulkMutateJobErrorReason' => 'Google::Ads::AdWords::v201502::BulkMutateJobError::Reason',
        'CampaignAdExtensionErrorReason' => 'Google::Ads::AdWords::v201502::CampaignAdExtensionError::Reason',
        'CampaignCriterionErrorReason' => 'Google::Ads::AdWords::v201502::CampaignCriterionError::Reason',
        'CampaignErrorReason' => 'Google::Ads::AdWords::v201502::CampaignError::Reason',
        'ClientTermsErrorReason' => 'Google::Ads::AdWords::v201502::ClientTermsError::Reason',
        'CollectionSizeErrorReason' => 'Google::Ads::AdWords::v201502::CollectionSizeError::Reason',
        'CriterionErrorReason' => 'Google::Ads::AdWords::v201502::CriterionError::Reason',
        'DatabaseErrorReason' => 'Google::Ads::AdWords::v201502::DatabaseError::Reason',
        'DateErrorReason' => 'Google::Ads::AdWords::v201502::DateError::Reason',
        'DateRangeErrorReason' => 'Google::Ads::AdWords::v201502::DateRangeError::Reason',
        'DistinctErrorReason' => 'Google::Ads::AdWords::v201502::DistinctError::Reason',
        'EntityAccessDeniedReason' => 'Google::Ads::AdWords::v201502::EntityAccessDenied::Reason',
        'EntityCountLimitExceededReason' => 'Google::Ads::AdWords::v201502::EntityCountLimitExceeded::Reason',
        'EntityNotFoundReason' => 'Google::Ads::AdWords::v201502::EntityNotFound::Reason',
        'ExperimentErrorReason' => 'Google::Ads::AdWords::v201502::ExperimentError::Reason',
        'FeedAttributeReferenceErrorReason' => 'Google::Ads::AdWords::v201502::FeedAttributeReferenceError::Reason',
        'FeedItemErrorReason' => 'Google::Ads::AdWords::v201502::FeedItemError::Reason',
        'ForwardCompatibilityErrorReason' => 'Google::Ads::AdWords::v201502::ForwardCompatibilityError::Reason',
        'FunctionErrorReason' => 'Google::Ads::AdWords::v201502::FunctionError::Reason',
        'FunctionParsingErrorReason' => 'Google::Ads::AdWords::v201502::FunctionParsingError::Reason',
        'IdErrorReason' => 'Google::Ads::AdWords::v201502::IdError::Reason',
        'ImageErrorReason' => 'Google::Ads::AdWords::v201502::ImageError::Reason',
        'InternalApiErrorReason' => 'Google::Ads::AdWords::v201502::InternalApiError::Reason',
        'JobErrorReason' => 'Google::Ads::AdWords::v201502::JobError::Reason',
        'MediaErrorReason' => 'Google::Ads::AdWords::v201502::MediaError::Reason',
        'MultiplierErrorReason' => 'Google::Ads::AdWords::v201502::MultiplierError::Reason',
        'NewEntityCreationErrorReason' => 'Google::Ads::AdWords::v201502::NewEntityCreationError::Reason',
        'NotEmptyErrorReason' => 'Google::Ads::AdWords::v201502::NotEmptyError::Reason',
        'NullErrorReason' => 'Google::Ads::AdWords::v201502::NullError::Reason',
        'OperationAccessDeniedReason' => 'Google::Ads::AdWords::v201502::OperationAccessDenied::Reason',
        'OperatorErrorReason' => 'Google::Ads::AdWords::v201502::OperatorError::Reason',
        'PagingErrorReason' => 'Google::Ads::AdWords::v201502::PagingError::Reason',
        'PolicyViolationErrorReason' => 'Google::Ads::AdWords::v201502::PolicyViolationError::Reason',
        'QueryErrorReason' => 'Google::Ads::AdWords::v201502::QueryError::Reason',
        'QuotaCheckErrorReason' => 'Google::Ads::AdWords::v201502::QuotaCheckError::Reason',
        'RangeErrorReason' => 'Google::Ads::AdWords::v201502::RangeError::Reason',
        'RateExceededErrorReason' => 'Google::Ads::AdWords::v201502::RateExceededError::Reason',
        'ReadOnlyErrorReason' => 'Google::Ads::AdWords::v201502::ReadOnlyError::Reason',
        'RegionCodeErrorReason' => 'Google::Ads::AdWords::v201502::RegionCodeError::Reason',
        'RejectedErrorReason' => 'Google::Ads::AdWords::v201502::RejectedError::Reason',
        'RequestErrorReason' => 'Google::Ads::AdWords::v201502::RequestError::Reason',
        'RequiredErrorReason' => 'Google::Ads::AdWords::v201502::RequiredError::Reason',
        'SelectorErrorReason' => 'Google::Ads::AdWords::v201502::SelectorError::Reason',
        'SettingErrorReason' => 'Google::Ads::AdWords::v201502::SettingError::Reason',
        'SizeLimitErrorReason' => 'Google::Ads::AdWords::v201502::SizeLimitError::Reason',
        'StatsQueryErrorReason' => 'Google::Ads::AdWords::v201502::StatsQueryError::Reason',
        'StringFormatErrorReason' => 'Google::Ads::AdWords::v201502::StringFormatError::Reason',
        'StringLengthErrorReason' => 'Google::Ads::AdWords::v201502::StringLengthError::Reason',
        'UrlErrorReason' => 'Google::Ads::AdWords::v201502::UrlError::Reason',
    },
    {

        'AdCustomizerErrorReason' => 'AdCustomizerErrorReason',
        'AdErrorReason' => 'AdErrorReason',
        'AdExtensionErrorReason' => 'AdExtensionErrorReason',
        'AdGroupAdErrorReason' => 'AdGroupAdErrorReason',
        'AdGroupCriterionErrorReason' => 'AdGroupCriterionErrorReason',
        'AdGroupServiceErrorReason' => 'AdGroupServiceErrorReason',
        'AdxErrorReason' => 'AdxErrorReason',
        'AuthenticationErrorReason' => 'AuthenticationErrorReason',
        'AuthorizationErrorReason' => 'AuthorizationErrorReason',
        'BetaErrorReason' => 'BetaErrorReason',
        'BiddingErrorReason' => 'BiddingErrorReason',
        'BiddingErrorsReason' => 'BiddingErrorsReason',
        'BiddingTransitionErrorReason' => 'BiddingTransitionErrorReason',
        'BudgetErrorReason' => 'BudgetErrorReason',
        'BulkMutateJobErrorReason' => 'BulkMutateJobErrorReason',
        'CampaignAdExtensionErrorReason' => 'CampaignAdExtensionErrorReason',
        'CampaignCriterionErrorReason' => 'CampaignCriterionErrorReason',
        'CampaignErrorReason' => 'CampaignErrorReason',
        'ClientTermsErrorReason' => 'ClientTermsErrorReason',
        'CollectionSizeErrorReason' => 'CollectionSizeErrorReason',
        'CriterionErrorReason' => 'CriterionErrorReason',
        'DatabaseErrorReason' => 'DatabaseErrorReason',
        'DateErrorReason' => 'DateErrorReason',
        'DateRangeErrorReason' => 'DateRangeErrorReason',
        'DistinctErrorReason' => 'DistinctErrorReason',
        'EntityAccessDeniedReason' => 'EntityAccessDeniedReason',
        'EntityCountLimitExceededReason' => 'EntityCountLimitExceededReason',
        'EntityNotFoundReason' => 'EntityNotFoundReason',
        'ExperimentErrorReason' => 'ExperimentErrorReason',
        'FeedAttributeReferenceErrorReason' => 'FeedAttributeReferenceErrorReason',
        'FeedItemErrorReason' => 'FeedItemErrorReason',
        'ForwardCompatibilityErrorReason' => 'ForwardCompatibilityErrorReason',
        'FunctionErrorReason' => 'FunctionErrorReason',
        'FunctionParsingErrorReason' => 'FunctionParsingErrorReason',
        'IdErrorReason' => 'IdErrorReason',
        'ImageErrorReason' => 'ImageErrorReason',
        'InternalApiErrorReason' => 'InternalApiErrorReason',
        'JobErrorReason' => 'JobErrorReason',
        'MediaErrorReason' => 'MediaErrorReason',
        'MultiplierErrorReason' => 'MultiplierErrorReason',
        'NewEntityCreationErrorReason' => 'NewEntityCreationErrorReason',
        'NotEmptyErrorReason' => 'NotEmptyErrorReason',
        'NullErrorReason' => 'NullErrorReason',
        'OperationAccessDeniedReason' => 'OperationAccessDeniedReason',
        'OperatorErrorReason' => 'OperatorErrorReason',
        'PagingErrorReason' => 'PagingErrorReason',
        'PolicyViolationErrorReason' => 'PolicyViolationErrorReason',
        'QueryErrorReason' => 'QueryErrorReason',
        'QuotaCheckErrorReason' => 'QuotaCheckErrorReason',
        'RangeErrorReason' => 'RangeErrorReason',
        'RateExceededErrorReason' => 'RateExceededErrorReason',
        'ReadOnlyErrorReason' => 'ReadOnlyErrorReason',
        'RegionCodeErrorReason' => 'RegionCodeErrorReason',
        'RejectedErrorReason' => 'RejectedErrorReason',
        'RequestErrorReason' => 'RequestErrorReason',
        'RequiredErrorReason' => 'RequiredErrorReason',
        'SelectorErrorReason' => 'SelectorErrorReason',
        'SettingErrorReason' => 'SettingErrorReason',
        'SizeLimitErrorReason' => 'SizeLimitErrorReason',
        'StatsQueryErrorReason' => 'StatsQueryErrorReason',
        'StringFormatErrorReason' => 'StringFormatErrorReason',
        'StringLengthErrorReason' => 'StringLengthErrorReason',
        'UrlErrorReason' => 'UrlErrorReason',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

Google::Ads::AdWords::v201502::ApiErrorReason

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
ApiErrorReason from the namespace https://adwords.google.com/api/adwords/cm/v201502.

Interface that has a reason return an associated service error. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * AdCustomizerErrorReason


=item * AdErrorReason


=item * AdExtensionErrorReason


=item * AdGroupAdErrorReason


=item * AdGroupCriterionErrorReason


=item * AdGroupServiceErrorReason


=item * AdxErrorReason


=item * AuthenticationErrorReason


=item * AuthorizationErrorReason


=item * BetaErrorReason


=item * BiddingErrorReason


=item * BiddingErrorsReason


=item * BiddingTransitionErrorReason


=item * BudgetErrorReason


=item * BulkMutateJobErrorReason


=item * CampaignAdExtensionErrorReason


=item * CampaignCriterionErrorReason


=item * CampaignErrorReason


=item * ClientTermsErrorReason


=item * CollectionSizeErrorReason


=item * CriterionErrorReason


=item * DatabaseErrorReason


=item * DateErrorReason


=item * DateRangeErrorReason


=item * DistinctErrorReason


=item * EntityAccessDeniedReason


=item * EntityCountLimitExceededReason


=item * EntityNotFoundReason


=item * ExperimentErrorReason


=item * FeedAttributeReferenceErrorReason


=item * FeedItemErrorReason


=item * ForwardCompatibilityErrorReason


=item * FunctionErrorReason


=item * FunctionParsingErrorReason


=item * IdErrorReason


=item * ImageErrorReason


=item * InternalApiErrorReason


=item * JobErrorReason


=item * MediaErrorReason


=item * MultiplierErrorReason


=item * NewEntityCreationErrorReason


=item * NotEmptyErrorReason


=item * NullErrorReason


=item * OperationAccessDeniedReason


=item * OperatorErrorReason


=item * PagingErrorReason


=item * PolicyViolationErrorReason


=item * QueryErrorReason


=item * QuotaCheckErrorReason


=item * RangeErrorReason


=item * RateExceededErrorReason


=item * ReadOnlyErrorReason


=item * RegionCodeErrorReason


=item * RejectedErrorReason


=item * RequestErrorReason


=item * RequiredErrorReason


=item * SelectorErrorReason


=item * SettingErrorReason


=item * SizeLimitErrorReason


=item * StatsQueryErrorReason


=item * StringFormatErrorReason


=item * StringLengthErrorReason


=item * UrlErrorReason




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():






=head1 AUTHOR

Generated by SOAP::WSDL

=cut

