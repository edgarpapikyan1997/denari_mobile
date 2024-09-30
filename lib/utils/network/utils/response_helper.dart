import 'package:dio/dio.dart';

extension ResponseHelper<T> on Response<T> {
  K item<K>(K Function(Map<String, dynamic> json) fromJson) {
    final value =
        (data! as Map<String, dynamic>)['value'] as Map<String, dynamic>?;
    if (value == null) {
      return fromJson.call(data! as Map<String, dynamic>);
    }
    return fromJson.call(value);
  }
}
