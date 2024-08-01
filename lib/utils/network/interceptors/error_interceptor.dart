import 'dart:io';

import 'package:denari_app/utils/network/exceptions/api_error.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    var error = 'Error receiving data from server';
    final data = response.data;
    if (data is Map<String, dynamic> && data.containsKey('error')) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: data.toString(),
          error: error,
        ),
      );
    }
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.error?.runtimeType == SocketException) {
      return handler.next(
        ConnectionError(
          dioError: err,
          message: 'Connection error: ${err.message}',
        ),
      );
    }
    final response = err.response;
    if (response != null) {
      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('error')) {
        final message = data['error'];
        return handler.next(
          ApiError(
            dioError: err,
            message: message,
          ),
        );
      }
    }
    return handler.next(err);
  }
}
