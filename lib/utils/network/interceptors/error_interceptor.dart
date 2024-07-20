import 'dart:convert';
import 'dart:io';

import 'package:denari_app/utils/log/logging.dart';
import 'package:denari_app/utils/network/exceptions/api_error.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  final _logger = logger;

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    var error = 'Error receiving data from server';
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data['status'] == 'error') {
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            message: data.toString(),
            error: error,
          ),
        );
      }
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
      final statusCode = response.statusCode;
      if (statusCode != null &&
          statusCode >= HttpStatus.badRequest &&
          statusCode <= HttpStatus.internalServerError) {
        if (response.data != null) {
          Map<String, dynamic>? map;
          if (response.data is String) {
            try {
              map =
                  json.decode(response.data as String) as Map<String, dynamic>;
            } catch (e, st) {
              _logger.warning(
                'An error occurred while parsing error response:',
                e,
                st,
              );
            }
          } else {
            map = response.data as Map<String, dynamic>;
          }
          final message = map.toString();
          return handler.next(
            ApiError(
              dioError: err,
              message: message,
            ),
          );
        }
      }
    }
    return handler.next(err);
  }
}
