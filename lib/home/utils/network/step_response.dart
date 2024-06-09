import 'package:json_annotation/json_annotation.dart';

part 'step_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class StepResponse {
  StepResponse({
    required this.id,
    required this.projectId,
    required this.title,
    required this.details,
    required this.assets,
    required this.order,
    required this.isCompleted,
    required this.completedBy,
  });

  factory StepResponse.fromJson(Map<String, dynamic> result) => _$StepResponseFromJson(result);

  final String id;
  final String projectId;
  final String title;
  final String details;
  final List<String> assets;
  final int order;
  final bool isCompleted;
  final String? completedBy;
}
