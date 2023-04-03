import 'package:freezed_annotation/freezed_annotation.dart';

import '../dio_failure/dio_failure.dart';

export '../dio_failure/dio_failure.dart';

part 'dio_response.freezed.dart';

@freezed
class DioResponse with _$DioResponse {
  const DioResponse._();

  factory DioResponse.failed(
    DioFailure failure,
  ) = _$FailedDioResponse;

  factory DioResponse.successful(
    Response<dynamic> response,
  ) = _$SuccessfulDioResponse;
}
