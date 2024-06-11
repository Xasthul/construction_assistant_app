import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_authorized_client.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/home/utils/network/step_response.dart';

class StepDetailsService {
  final DioAuthorizedClient _client = getIt<DioAuthorizedClient>();

  Future<StepResponse> getStepDetails({
    required String projectId,
    required String stepId,
  }) async {
    final response = await _client.get(
      '${AppConstants.serviceUrl}/steps/$stepId',
      params: {'projectId': projectId},
    );
    final appDataResponse = AppDataResponse.fromJson(response);
    final stepResponse = appDataResponse.data as Map<String, dynamic>;
    return StepResponse.fromJson(stepResponse);
  }

  Future<void> updateStepDetails({
    required String projectId,
    required String stepId,
    String? title,
    String? details,
    List<String>? assets,
    int? order,
  }) async =>
      _client.put(
        '${AppConstants.serviceUrl}/steps/$stepId',
        params: {'projectId': projectId},
        body: {
          if (title != null) 'title': title,
          if (details != null) 'details': details,
          if (assets != null) 'assets': assets,
          if (order != null) 'order': order,
        },
      );

  Future<void> deleteStep({
    required String projectId,
    required String stepId,
  }) async =>
      _client.delete(
        '${AppConstants.serviceUrl}/steps/$stepId',
        params: {'projectId': projectId},
      );

  Future<void> completeStep({
    required String projectId,
    required String stepId,
  }) async =>
      _client.post(
        '${AppConstants.serviceUrl}/steps/$stepId/complete',
        params: {'projectId': projectId},
      );
}
