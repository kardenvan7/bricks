import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioLoggerInterceptor extends PrettyDioLogger {
  DioLoggerInterceptor({
    super.request = true,
    super.requestHeader = true,
    super.requestBody = false,
    super.responseHeader = true,
    super.responseBody = true,
    super.error = true,
    super.maxWidth = 90,
    super.compact = true,
    super.logPrint = print,
  });
}
