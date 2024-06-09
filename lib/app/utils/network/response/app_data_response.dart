import 'package:json_annotation/json_annotation.dart';

part 'app_data_response.g.dart';

@JsonSerializable()
class AppDataResponse {
  const AppDataResponse({required this.data});

  factory AppDataResponse.fromJson(Map<String, dynamic> json) => _$AppDataResponseFromJson(json);

  final Map<String, dynamic> data;
}
