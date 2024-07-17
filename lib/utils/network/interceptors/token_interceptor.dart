import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/env/config.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:denari_app/utils/network/model/api_token.dart';
import 'package:denari_app/utils/network/utils/response_helper.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptor {
  final TokenPreferences preferencesRepository;

  TokenInterceptor(this.preferencesRepository);

  Map<String, String> _tokenHeader(ApiToken token) =>
      {'Authorization': '${token.tokenType} ${token.token}'};

  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final currentToken = await token;
    if (currentToken != null) {
      options.headers.addAll(_tokenHeader(currentToken));
    }
    handler.next(options);
  }

  @override
  Future<dynamic> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (await token == null || !_shouldRefresh(response)) {
      return handler.next(response);
    }
    try {
      final refreshResponse = await _tryRefresh(response);
      handler.resolve(refreshResponse);
    } on DioException catch (error) {
      handler.reject(error);
    }
  }

  @override
  Future<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response == null || await token == null || !_shouldRefresh(response)) {
      return handler.next(err);
    }
    try {
      final refreshResponse = await _tryRefresh(response);
      handler.resolve(refreshResponse);
    } on DioException catch (error) {
      handler.next(error);
    }
  }

  Future<Response<dynamic>> _tryRefresh(Response<dynamic> response) async {
    late final ApiToken refreshedToken;
    try {
      refreshedToken = await _refreshToken(await token);
    } catch (error) {
      await clearToken();
      throw DioException(
        requestOptions: response.requestOptions,
        error: error,
        response: response,
      );
    }

    await setToken(refreshedToken);
    final client = di.get<Dio>()!;
    client.options.baseUrl = response.requestOptions.baseUrl;
    return client.request<dynamic>(
      response.requestOptions.path,
      cancelToken: response.requestOptions.cancelToken,
      data: response.requestOptions.data,
      onReceiveProgress: response.requestOptions.onReceiveProgress,
      onSendProgress: response.requestOptions.onSendProgress,
      queryParameters: response.requestOptions.queryParameters,
      options: Options(
        method: response.requestOptions.method,
        sendTimeout: response.requestOptions.sendTimeout,
        receiveTimeout: response.requestOptions.receiveTimeout,
        extra: response.requestOptions.extra,
        headers: response.requestOptions.headers
          ..addAll(_tokenHeader(refreshedToken)),
        responseType: response.requestOptions.responseType,
        contentType: response.requestOptions.contentType,
        validateStatus: response.requestOptions.validateStatus,
        receiveDataWhenStatusError:
            response.requestOptions.receiveDataWhenStatusError,
        followRedirects: response.requestOptions.followRedirects,
        maxRedirects: response.requestOptions.maxRedirects,
        requestEncoder: response.requestOptions.requestEncoder,
        responseDecoder: response.requestOptions.responseDecoder,
        listFormat: response.requestOptions.listFormat,
      ),
    );
  }

  Future<ApiToken?> get token async {
    try {
      return await preferencesRepository.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<void> setToken(ApiToken token) async {
    try {
      await preferencesRepository.setToken(token);
    } catch (e) {}
  }

  Future<void> clearToken() async {
    try {
      await preferencesRepository.deleteToken();
    } catch (e) {}
  }

  static bool _shouldRefresh(Response<dynamic>? response) =>
      response?.statusCode == 401;

  static Future<ApiToken> _refreshToken(token) async {
    final response = await di.get<Dio>()!.post(
      '${di.get<Config>()!.host}/refresh_token/',
      data: FormData.fromMap({'refresh_token': token?.refreshToken ?? ''}),
    );
    return response.item(ApiToken.fromJson);
  }
}
