// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiToken _$ApiTokenFromJson(Map<String, dynamic> json) => ApiToken(
      token: json['token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
      refreshExpiresIn: (json['refresh_expires_in'] as num?)?.toInt() ?? 0,
      tokenType: json['token_type'] as String? ?? '',
      notBeforePolicy: (json['not-before-policy'] as num?)?.toInt() ?? 0,
      scope: json['scope'] as String? ?? '',
    );

Map<String, dynamic> _$ApiTokenToJson(ApiToken instance) => <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
      'token_type': instance.tokenType,
      'not-before-policy': instance.notBeforePolicy,
      'scope': instance.scope,
    };
