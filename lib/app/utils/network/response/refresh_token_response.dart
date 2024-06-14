import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RefreshTokenResponse {
  RefreshTokenResponse({required this.refreshToken});

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> result) => _$RefreshTokenResponseFromJson(result);

  final String refreshToken;
}
