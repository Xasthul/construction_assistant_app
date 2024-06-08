import 'package:json_annotation/json_annotation.dart';

part 'access_token_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class AccessTokenResponse {
  AccessTokenResponse({required this.accessToken});

  factory AccessTokenResponse.fromJson(Map<String, dynamic> result) => _$AccessTokenResponseFromJson(result);

  final String accessToken;
}
