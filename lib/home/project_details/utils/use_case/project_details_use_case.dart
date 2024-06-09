import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/home/project_details/utils/service/project_details_service.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/mapper/home_mapper.dart';

class ProjectDetailsUseCase {
  final ProjectDetailsService _projectDetailsService = getIt<ProjectDetailsService>();
  final HomeMapper _homeMapper = getIt<HomeMapper>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<Project> getProjectDetails({required String projectId}) async {
    try {
      final projectResponse = await _projectDetailsService.getProjectDetails(projectId: projectId);
      return _homeMapper.mapProjectResponseToDomain(projectResponse);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> updateProjectDetails({
    required String projectId,
    required String newTitle,
  }) async {
    try {
      await _projectDetailsService.updateProjectDetails(
        projectId: projectId,
        newTitle: newTitle,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> deleteProject({required String projectId}) async {
    try {
      await _projectDetailsService.deleteProject(projectId: projectId);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> addUserToProject({
    required String projectId,
    required String userEmail,
  }) async {
    try {
      await _projectDetailsService.addUserToProject(
        projectId: projectId,
        userEmail: userEmail,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> deleteUserFromProject({
    required String projectId,
    required String userEmail,
  }) async {
    try {
      await _projectDetailsService.deleteUserFromProject(
        projectId: projectId,
        userEmail: userEmail,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<List<Step>> getProjectSteps({required String projectId}) async {
    try {
      final stepsResponse = await _projectDetailsService.getProjectSteps(projectId: projectId);
      return stepsResponse
          .map(
            (stepResponse) => _homeMapper.mapStepResponseToDomain(stepResponse),
          )
          .toList();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> createStep({
    required String projectId,
    required String title,
    required String details,
    required List<String> assets,
    required int order,
  }) async {
    try {
      await _projectDetailsService.createStep(
        projectId: projectId,
        title: title,
        details: details,
        assets: assets,
        order: order,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }
}
