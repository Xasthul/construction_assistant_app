import 'package:construction_assistant_app/home/utils/network/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ProjectResponse {
  ProjectResponse({
    required this.id,
    required this.title,
    required this.users,
    required this.createdBy,
  });

  factory ProjectResponse.fromJson(Map<String, dynamic> result) => _$ProjectResponseFromJson(result);

  final String id;
  final String title;
  final List<UserResponse> users;
  final String createdBy;
}
