import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> result) => _$LoginResponseFromJson(result);

  final String accessToken;
  final String refreshToken;
}
