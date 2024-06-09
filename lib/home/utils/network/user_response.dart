import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserResponse {
  UserResponse({
    required this.name,
    required this.email,
  });

  factory UserResponse.fromJson(Map<String, dynamic> result) => _$UserResponseFromJson(result);

  final String name;
  final String email;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
