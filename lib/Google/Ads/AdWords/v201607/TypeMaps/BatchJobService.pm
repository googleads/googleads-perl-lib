
package Google::Ads::AdWords::v201607::TypeMaps::BatchJobService;
use strict;
use warnings;

our $typemap_1 = {
               'get/selector/paging' => 'Google::Ads::AdWords::v201607::Paging',
               'queryResponse/rval/entries/id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]/reason' => 'Google::Ads::AdWords::v201607::OperationAccessDenied::Reason',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[IdError]' => 'Google::Ads::AdWords::v201607::IdError',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/uploadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/diskUsageQuotaBalance' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'mutateResponse/rval/value/processingErrors/reason' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError::Reason',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/progressStats' => 'Google::Ads::AdWords::v201607::ProgressStats',
               'getResponse/rval/entries/uploadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/diskUsageQuotaBalance' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/progressStats/estimatedPercentExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]' => 'Google::Ads::AdWords::v201607::BatchJobError',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/retryAfterSeconds' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'get/selector/paging/startIndex' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'ApiExceptionFault/message' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequestError]' => 'Google::Ads::AdWords::v201607::RequestError',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]' => 'Google::Ads::AdWords::v201607::DistinctError',
               'queryResponse/rval/entries/processingErrors/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]' => 'Google::Ads::AdWords::v201607::StringLengthError',
               'queryResponse/rval/entries' => 'Google::Ads::AdWords::v201607::BatchJob',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[IdError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequestError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/ordering' => 'Google::Ads::AdWords::v201607::OrderBy',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/uploadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RangeError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'ApiExceptionFault/errors/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/fields' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/uploadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'Fault/detail/ApiExceptionFault/errors[RequestError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operator' => 'Google::Ads::AdWords::v201607::Operator',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'queryResponse/rval/entries/processingErrors/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'ApiExceptionFault/errors/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/downloadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'Fault/detail/ApiExceptionFault/errors[RangeError]' => 'Google::Ads::AdWords::v201607::RangeError',
               'mutate/operations/operand/downloadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'mutate/operations/operand/processingErrors' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError',
               'queryResponse/rval/entries/downloadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/status' => 'Google::Ads::AdWords::v201607::BatchJobStatus',
               'mutateResponse/rval/value/downloadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequestError]/reason' => 'Google::Ads::AdWords::v201607::RequestError::Reason',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/totalNumEntries' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]/reason' => 'Google::Ads::AdWords::v201607::NotEmptyError::Reason',
               'mutateResponse/rval/value/processingErrors/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/predicates' => 'Google::Ads::AdWords::v201607::Predicate',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/processingErrors/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/processingErrors/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/downloadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/Page.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]' => 'Google::Ads::AdWords::v201607::AuthenticationError',
               'get/selector/predicates/operator' => 'Google::Ads::AdWords::v201607::Predicate::Operator',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/downloadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/ordering/sortOrder' => 'Google::Ads::AdWords::v201607::SortOrder',
               'Fault/detail/ApiExceptionFault/errors[RequestError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/downloadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/uploadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'mutate/operations/operand/uploadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/processingErrors/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/paging/numberResults' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail' => 'Google::Ads::AdWords::FaultDetail',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse' => 'Google::Ads::AdWords::v201607::BatchJobService::mutateResponse',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]' => 'Google::Ads::AdWords::v201607::DatabaseError',
               'getResponse/rval/entries/progressStats/numOperationsSucceeded' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'get' => 'Google::Ads::AdWords::v201607::BatchJobService::get',
               'Fault/detail/ApiExceptionFault/errors[RangeError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]/reason' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError::Reason',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval' => 'Google::Ads::AdWords::v201607::BatchJobReturnValue',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/progressStats/numOperationsSucceeded' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]' => 'Google::Ads::AdWords::v201607::RateExceededError',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/predicates/values' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/processingErrors/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]/reason' => 'Google::Ads::AdWords::v201607::RejectedError::Reason',
               'mutateResponse/rval/ListReturnValue.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'mutateResponse/rval/value/progressStats/estimatedPercentExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'getResponse/rval/entries/processingErrors/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/status' => 'Google::Ads::AdWords::v201607::BatchJobStatus',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]' => 'Google::Ads::AdWords::v201607::InternalApiError',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/processingErrors/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]/reason' => 'Google::Ads::AdWords::v201607::AuthorizationError::Reason',
               'getResponse/rval/entries/processingErrors' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError',
               'getResponse/rval/entries/processingErrors/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RangeError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'ApiExceptionFault/errors' => 'Google::Ads::AdWords::v201607::ApiError',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]/reason' => 'Google::Ads::AdWords::v201607::SelectorError::Reason',
               'query/query' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]/reason' => 'Google::Ads::AdWords::v201607::RequiredError::Reason',
               'getResponse/rval/entries/processingErrors/reason' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError::Reason',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/dateRange/max' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]' => 'Google::Ads::AdWords::v201607::ClientTermsError',
               'query' => 'Google::Ads::AdWords::v201607::BatchJobService::query',
               'queryResponse/rval/entries/progressStats/numResultsWritten' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/faultstring' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value' => 'Google::Ads::AdWords::v201607::BatchJob',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/downloadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/progressStats' => 'Google::Ads::AdWords::v201607::ProgressStats',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]/reason' => 'Google::Ads::AdWords::v201607::SizeLimitError::Reason',
               'ApiExceptionFault/errors/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/totalNumEntries' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]' => 'Google::Ads::AdWords::v201607::RequiredError',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]' => 'Google::Ads::AdWords::v201607::RejectedError',
               'queryResponse/rval/entries/uploadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/progressStats/numOperationsExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/id' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'ApiExceptionFault/errors/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]/reason' => 'Google::Ads::AdWords::v201607::InternalApiError::Reason',
               'Fault/detail/ApiExceptionFault/errors[RequiredError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]/reason' => 'Google::Ads::AdWords::v201607::DatabaseError::Reason',
               'Fault/faultcode' => 'SOAP::WSDL::XSD::Typelib::Builtin::anyURI',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]' => 'Google::Ads::AdWords::v201607::ReadOnlyError',
               'get/selector/dateRange' => 'Google::Ads::AdWords::v201607::DateRange',
               'mutate/operations/Operation.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse' => 'Google::Ads::AdWords::v201607::BatchJobService::getResponse',
               'queryResponse/rval' => 'Google::Ads::AdWords::v201607::BatchJobPage',
               'getResponse/rval/entries/downloadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]' => 'Google::Ads::AdWords::v201607::SizeLimitError',
               'get/selector/ordering/field' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]/reason' => 'Google::Ads::AdWords::v201607::BatchJobError::Reason',
               'mutate/operations/operand/progressStats/numOperationsExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[IdError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/processingErrors/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]' => 'Google::Ads::AdWords::v201607::StringFormatError',
               'get/selector' => 'Google::Ads::AdWords::v201607::Selector',
               'ApiExceptionFault' => 'Google::Ads::AdWords::v201607::ApiException',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]' => 'Google::Ads::AdWords::v201607::OperationAccessDenied',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/diskUsageQuotaBalance' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'mutateResponse/rval/value/progressStats/numResultsWritten' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/reason' => 'Google::Ads::AdWords::v201607::RateExceededError::Reason',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/progressStats/numOperationsExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'queryResponse/rval/entries/processingErrors/reason' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError::Reason',
               'mutate' => 'Google::Ads::AdWords::v201607::BatchJobService::mutate',
               'queryResponse' => 'Google::Ads::AdWords::v201607::BatchJobService::queryResponse',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]/reason' => 'Google::Ads::AdWords::v201607::OperatorError::Reason',
               'getResponse/rval/entries/status' => 'Google::Ads::AdWords::v201607::BatchJobStatus',
               'Fault/detail/ApiExceptionFault/errors[RangeError]/reason' => 'Google::Ads::AdWords::v201607::RangeError::Reason',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/progressStats/numResultsWritten' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'mutateResponse/rval/value/uploadUrl/url' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RangeError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/processingErrors/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[ClientTermsError]/reason' => 'Google::Ads::AdWords::v201607::ClientTermsError::Reason',
               'Fault/detail/ApiExceptionFault/errors[IdError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault' => 'SOAP::WSDL::SOAP::Typelib::Fault11',
               'Fault/detail/ApiExceptionFault/errors[IdError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors' => 'Google::Ads::AdWords::v201607::ApiError',
               'getResponse/rval/entries/progressStats' => 'Google::Ads::AdWords::v201607::ProgressStats',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/downloadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/processingErrors/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/progressStats/numOperationsSucceeded' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'queryResponse/rval/entries/processingErrors' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError',
               'Fault/detail/ApiExceptionFault/errors[IdError]/reason' => 'Google::Ads::AdWords::v201607::IdError::Reason',
               'mutateResponse/rval/value/processingErrors/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/dateRange/min' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/processingErrors' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError',
               'Fault/detail/ApiExceptionFault/errors[ReadOnlyError]/reason' => 'Google::Ads::AdWords::v201607::ReadOnlyError::Reason',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]' => 'Google::Ads::AdWords::v201607::AuthorizationError',
               'getResponse/rval/entries/progressStats/numResultsWritten' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]' => 'Google::Ads::AdWords::v201607::SelectorError',
               'queryResponse/rval/entries/uploadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/Page.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]/reason' => 'Google::Ads::AdWords::v201607::QuotaCheckError::Reason',
               'getResponse/rval/entries' => 'Google::Ads::AdWords::v201607::BatchJob',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/faultactor' => 'SOAP::WSDL::XSD::Typelib::Builtin::token',
               'Fault/detail/ApiExceptionFault/errors[RequestError]/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutateResponse/rval/value/progressStats/numOperationsSucceeded' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand' => 'Google::Ads::AdWords::v201607::BatchJob',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/uploadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperatorError]' => 'Google::Ads::AdWords::v201607::OperatorError',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]' => 'Google::Ads::AdWords::v201607::QuotaCheckError',
               'mutate/operations/operand/processingErrors/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/processingErrors/errorString' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[OperationAccessDenied]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'queryResponse/rval/entries/status' => 'Google::Ads::AdWords::v201607::BatchJobStatus',
               'getResponse/rval/entries/downloadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'ApiExceptionFault/ApplicationException.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[StringLengthError]/reason' => 'Google::Ads::AdWords::v201607::StringLengthError::Reason',
               'Fault/detail/ApiExceptionFault/errors[RejectedError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DistinctError]/reason' => 'Google::Ads::AdWords::v201607::DistinctError::Reason',
               'mutateResponse/rval/value/uploadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval' => 'Google::Ads::AdWords::v201607::BatchJobPage',
               'mutateResponse/rval/value/downloadUrl' => 'Google::Ads::AdWords::v201607::TemporaryUrl',
               'Fault/detail/ApiExceptionFault/errors[AuthenticationError]/reason' => 'Google::Ads::AdWords::v201607::AuthenticationError::Reason',
               'Fault/detail/ApiExceptionFault/errors[InternalApiError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'get/selector/predicates/field' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/diskUsageQuotaBalance' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'getResponse/rval/entries/uploadUrl/expiration' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[SelectorError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[QuotaCheckError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[DatabaseError]/fieldPath' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations/operand/progressStats' => 'Google::Ads::AdWords::v201607::ProgressStats',
               'Fault/detail/ApiExceptionFault/errors[StringFormatError]/reason' => 'Google::Ads::AdWords::v201607::StringFormatError::Reason',
               'mutate/operations/operand/progressStats/estimatedPercentExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/ApplicationException.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/progressStats/numOperationsExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::long',
               'Fault/detail/ApiExceptionFault/errors[NotEmptyError]' => 'Google::Ads::AdWords::v201607::NotEmptyError',
               'Fault/detail/ApiExceptionFault/errors[BatchJobError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'mutate/operations' => 'Google::Ads::AdWords::v201607::BatchJobOperation',
               'Fault/detail/ApiExceptionFault/errors[BatchJobProcessingError]' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError',
               'Fault/detail/ApiExceptionFault' => 'Google::Ads::AdWords::v201607::ApiException',
               'mutate/operations/operand/processingErrors/reason' => 'Google::Ads::AdWords::v201607::BatchJobProcessingError::Reason',
               'Fault/detail/ApiExceptionFault/errors[SizeLimitError]/trigger' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'getResponse/rval/entries/progressStats/estimatedPercentExecuted' => 'SOAP::WSDL::XSD::Typelib::Builtin::int',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/rateScope' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[AuthorizationError]/ApiError.Type' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/errors[RateExceededError]/rateName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
               'Fault/detail/ApiExceptionFault/message' => 'SOAP::WSDL::XSD::Typelib::Builtin::string'
             };
;

sub get_class {
  my $name = join '/', @{ $_[1] };
  return $typemap_1->{ $name };
}

sub get_typemap {
    return $typemap_1;
}

1;

__END__

__END__

=pod

=head1 NAME

Google::Ads::AdWords::v201607::TypeMaps::BatchJobService - typemap for BatchJobService

=head1 DESCRIPTION

Typemap created by SOAP::WSDL for map-based SOAP message parsers.

=cut

