import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{name}}/core/core.dart';

export 'package:dio/dio.dart' show Response;

part 'dio_failure.freezed.dart';

@freezed
class DioFailure with _$DioFailure {
  const DioFailure._();

  const factory DioFailure.timeout() = _$TimeoutDioFailure;
  const factory DioFailure.unknown(
    FailureInformation info,
  ) = _$UnknownDioFailure;
  const factory DioFailure.noInternet() = _$NoInternetDioFailure;
  const factory DioFailure.badResponse(Response response) =
      _$BadResponseDioFailure;

  RemoteFetchFailure toRemoteFetchFailure() {
    return when(
      timeout: RemoteFetchFailure.timeout,
      unknown: (info) => RemoteFetchFailure.unknown(info: info),
      noInternet: RemoteFetchFailure.noInternet,
      badResponse: (response) => RemoteFetchFailure.badResponse(
        BadResponseInformation(
          code: response.statusCode,
          message: response.statusMessage,
        ),
      ),
    );
  }
}
