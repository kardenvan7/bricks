import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:skelete_test/config/configuration_variables.dart';
import 'package:skelete_test/core/core.dart';

import 'dio_response/dio_response.dart';
import 'errors/no_internet_dio_error.dart';
import 'interceptors/dio_logger_interceptor.dart';

/// Class-wrapper for configured [Dio] instance.
///
/// If you need to get access to REST API with URL and contentType set in
/// [ConfigConstants] class, use this facade to perform GET and POST requests.
///
/// [get] and [post] methods results wrapped in [Result] class for convenience
/// so you don't have to check every time if response data is a [Map] or not and
/// also don't have to use try..catch clauses
///
class DioFacade {
  DioFacade({
    required Dio dio,
    required RestApiConfiguration configuration,
  })  : _dio = dio,
        _configuration = configuration;

  final Dio _dio;
  final RestApiConfiguration _configuration;

  bool _isInitialized = false;

  Future<void> initialize() {
    return Future.sync(
      () async {
        if (!_isInitialized) {
          _configureDio();
          _setUpListeners();

          _isInitialized = true;
        }
      },
    );
  }

  Future<DioResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    return _requestWrapper(
      () => _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<DioResponse> post(
    String path, {
    Options? options,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    void Function(int count, int total)? onSendProgress,
    void Function(int count, int total)? onReceiveProgress,
  }) async {
    return _requestWrapper(
      () => _dio.post(
        path,
        options: options,
        data: body,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  void _configureDio() {
    _setTimeouts(
      _configuration.connectionTimeout.value,
      _configuration.connectionTimeout.value,
    );
    _addInterceptors();
    _removeBadCertificateException();
  }

  void _setUpListeners() {
    _configuration.connectionTimeout.addListener(() {
      _dio.options.connectTimeout = _configuration.connectionTimeout.value;
    });

    _configuration.receiveTimeout.addListener(() {
      _dio.options.receiveTimeout = _configuration.receiveTimeout.value;
    });

    _configuration.enableDioLogging.addListener(() {
      if (_configuration.enableDioLogging.value) {
        _dio.interceptors.add(PrettyDioLogger());
      } else {
        _dio.interceptors.remove(
          PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseHeader: true,
          ),
        );
      }
    });
  }

  void _addInterceptors() {
    _dio.interceptors.addAll(
      [
        if (_configuration.enableDioLogging.value) DioLoggerInterceptor(),
      ],
    );
  }

  void _setTimeouts(Duration connectTimeout, Duration receiveTimeout) {
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
  }

  /// Needed to avoid [CERTIFICATE_VERIFY_FAILED] for test server if test
  /// server has no certificate
  ///
  void _removeBadCertificateException() {
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) =>
          true;

      return client;
    };
  }

  Future<DioResponse> _requestWrapper(
    Future<Response> Function() request,
  ) async {
    try {
      final Response response = await request();

      final formattedResponse = Response<dynamic>(
        requestOptions: response.requestOptions,
        extra: response.extra,
        redirects: response.redirects,
        headers: response.headers,
        isRedirect: response.isRedirect,
        data: response.data,
        statusMessage: response.statusMessage,
        statusCode: response.statusCode,
      );

      return DioResponse.successful(formattedResponse);
    } on TimeoutException {
      return DioResponse.failed(const DioFailure.timeout());
    } on DioError catch (e, st) {
      return DioResponse.failed(_getDioFailure(e, st));
    } on Exception catch (e, st) {
      return DioResponse.failed(
        DioFailure.unknown(FailureInformation(error: e, trace: st)),
      );
    }
  }

  DioFailure _getDioFailure(DioError e, StackTrace trace) {
    if (e is NoInternetDioError) {
      return const DioFailure.noInternet();
    }

    switch (e.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
        return const DioFailure.timeout();

      case DioErrorType.cancel:
      case DioErrorType.unknown:
      case DioErrorType.badCertificate:
      case DioErrorType.connectionError:
        return DioFailure.unknown(FailureInformation(error: e, trace: trace));

      case DioErrorType.badResponse:
        return DioFailure.badResponse(e.response!);
    }
  }
}
