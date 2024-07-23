import 'package:json_annotation/json_annotation.dart';

part 'api_token.g.dart';

@JsonSerializable()
class ApiToken {
  @JsonKey(defaultValue: '')
  final String token;
  @JsonKey(name: 'refresh_token', defaultValue: '')
  final String refreshToken;
  @JsonKey(name: 'expires_in', defaultValue: 0)
  final int expiresIn;
  @JsonKey(name: 'refresh_expires_in', defaultValue: 0)
  final int refreshExpiresIn;
  @JsonKey(name: 'token_type', defaultValue: '')
  final String tokenType;
  @JsonKey(name: 'not-before-policy', defaultValue: 0)
  final int notBeforePolicy;
  @JsonKey(defaultValue: '')
  final String scope;

  const ApiToken({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
    required this.refreshExpiresIn,
    required this.tokenType,
    required this.notBeforePolicy,
    required this.scope,
  });

  factory ApiToken.fromJson(Map<String, dynamic> json) =>
      _$ApiTokenFromJson(json);

  Map<String, dynamic> toJson() => _$ApiTokenToJson(this);

  ApiToken copyWith({
    String? token,
    String? refreshToken,
    int? expiresIn,
    int? refreshExpiresIn,
    String? tokenType,
    int? notBeforePolicy,
    String? scope,
  }) {
    return ApiToken(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshExpiresIn: refreshExpiresIn ?? this.refreshExpiresIn,
      tokenType: tokenType ?? this.tokenType,
      notBeforePolicy: notBeforePolicy ?? this.notBeforePolicy,
      scope: scope ?? this.scope,
    );
  }
}
