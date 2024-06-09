import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_authorized_client.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/home/utils/network/project_response.dart';
import 'package:construction_assistant_app/home/utils/network/step_response.dart';

class ProjectDetailsService {
  final DioAuthorizedClient _client = getIt<DioAuthorizedClient>();

  Future<ProjectResponse> getProjectDetails({required String projectId}) async {
    final response = await _client.get('${AppConstants.serviceUrl}/projects/$projectId');
    final appDataResponse = AppDataResponse.fromJson(response);
    return ProjectResponse.fromJson(appDataResponse.data as Map<String, dynamic>);
  }

  Future<void> updateProjectDetails({
    required String projectId,
    required String newTitle,
  }) async =>
      _client.put(
        '${AppConstants.serviceUrl}/projects/$projectId',
        body: {'title': newTitle},
      );

  Future<void> deleteProject({required String projectId}) async =>
      _client.delete('${AppConstants.serviceUrl}/projects/$projectId');

  Future<void> addUserToProject({
    required String projectId,
    required String userEmail,
  }) async =>
      _client.post(
        '${AppConstants.serviceUrl}/projects/$projectId/add-user',
        body: {'userEmail': userEmail},
      );

  Future<void> deleteUserFromProject({
    required String projectId,
    required String userEmail,
  }) async =>
      _client.delete(
        '${AppConstants.serviceUrl}/projects/$projectId/delete-user',
        body: {'userEmail': userEmail},
      );

  Future<List<StepResponse>> getProjectSteps({required String projectId}) async {
    final response = await _client.get(
      '${AppConstants.serviceUrl}/steps',
      params: {'projectId': projectId},
    );
    final appDataResponse = AppDataResponse.fromJson(response);
    final stepsResponse = appDataResponse.data as List<dynamic>;
    return stepsResponse
        .map((dynamic stepResponse) => StepResponse.fromJson(stepResponse as Map<String, dynamic>))
        .toList();
  }

  Future<void> createStep({
    required String projectId,
    required String title,
    required String details,
    required List<String> assets,
    required int order,
  }) async =>
      _client.post(
        '${AppConstants.serviceUrl}/steps/create',
        params: {'projectId': projectId},
        body: {
          'title': title,
          'details': details,
          'assets': assets,
          'order': order,
        },
      );
}
