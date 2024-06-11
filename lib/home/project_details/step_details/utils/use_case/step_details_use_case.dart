import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/service/step_details_service.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/mapper/home_mapper.dart';

class StepDetailsUseCase {
  final StepDetailsService _stepDetailsService = getIt<StepDetailsService>();
  final HomeMapper _homeMapper = getIt<HomeMapper>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<Step> getStepDetails({
    required String projectId,
    required String stepId,
  }) async {
    try {
      final stepResponse = await _stepDetailsService.getStepDetails(
        projectId: projectId,
        stepId: stepId,
      );
      return _homeMapper.mapStepResponseToDomain(stepResponse);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> updateStepDetails({
    required String projectId,
    required String stepId,
    String? title,
    String? details,
    List<String>? assets,
    int? order,
  }) async {
    try {
      await _stepDetailsService.updateStepDetails(
        projectId: projectId,
        stepId: stepId,
        title: title,
        details: details,
        assets: assets,
        order: order,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> deleteStep({
    required String projectId,
    required String stepId,
  }) async {
    try {
      await _stepDetailsService.deleteStep(
        projectId: projectId,
        stepId: stepId,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> completeStep({
    required String projectId,
    required String stepId,
  }) async {
    try {
      await _stepDetailsService.completeStep(
        projectId: projectId,
        stepId: stepId,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }
}
