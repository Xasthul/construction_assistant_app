import 'package:json_annotation/json_annotation.dart';

part 'core_error_response.g.dart';

@JsonSerializable()
class CoreErrorResponse {
  const CoreErrorResponse({
    required this.errorCode,
    required this.errorDetails,
  });

  factory CoreErrorResponse.fromJson(Map<String, dynamic> json) => _$CoreErrorResponseFromJson(json);

  final int errorCode;
  final String errorDetails;
}
