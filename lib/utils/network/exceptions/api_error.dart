import 'package:dio/dio.dart';

class ApiError extends DioException {
  ApiError({required DioException dioError, super.message})
      : super(
          type: dioError.type,
          error: dioError.error,
          response: dioError.response,
          requestOptions: dioError.requestOptions,
        );

  @override
  String toString() =>
      '$message, ${requestOptions.method}, '
          '${requestOptions.path}, '
          '${requestOptions.queryParameters}, '
          '${requestOptions.data}';
}

class ConnectionError extends DioException {
  ConnectionError({required DioException dioError, super.message})
      : super(
          type: dioError.type,
          error: dioError.error,
          response: dioError.response,
          requestOptions: dioError.requestOptions,
        );

  @override
  String toString() =>
      '$message, ${requestOptions.method}, '
          '${requestOptions.path}';
}
