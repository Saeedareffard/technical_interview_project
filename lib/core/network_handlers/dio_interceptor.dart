import 'package:dio/dio.dart';

abstract class ErrorParser {
  String parseError(DioException err);
}

class DefaultErrorParser implements ErrorParser {
  @override
  String parseError(DioException err) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return 'Connection Timeout Error';
    }
    if (err.type == DioExceptionType.badResponse) {
      if (err.response?.data is Map<String, dynamic>) {
        final errorData = err.response!.data as Map<String, dynamic>;
        return errorData['detail'] ??
            'Received invalid status code: ${err.response?.statusCode}';
      }
      return 'Received invalid status code: ${err.response?.statusCode}';
    }
    if (err.type == DioExceptionType.cancel) {
      return 'Request to API server was cancelled';
    }
    if (err.type == DioExceptionType.unknown) {
      return 'No Internet Connection';
    }
    return err.error.toString();
  }
}

class NetworkErrorInterceptor extends Interceptor {
  final ErrorParser _errorParser;
  NetworkErrorInterceptor(this._errorParser);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final message = _errorParser.parseError(err);
    handler.next(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: message,
    ));
  }
}
