import 'package:dio/dio.dart';

class NoInternetDioError extends DioError {
  NoInternetDioError({required super.requestOptions});
}
