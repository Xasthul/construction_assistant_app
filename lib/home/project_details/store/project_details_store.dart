import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/project_details/utils/use_case/project_details_use_case.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:mobx/mobx.dart';

part 'project_details_store.g.dart';

class ProjectDetailsStore = _ProjectDetailsStore with _$ProjectDetailsStore;

abstract class _ProjectDetailsStore with Store {
  _ProjectDetailsStore({required Project project}) : _project = project;

  final ProjectDetailsUseCase _projectDetailsUseCase = getIt<ProjectDetailsUseCase>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  Project _project;
  @readonly
  List<Step> _steps = [];
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  int get stepsCount => _steps.length;

  @action
  Future<void> load() async {
    await _loadSteps();
  }

  Future<void> _loadSteps() async {
    try {
      _steps = await _projectDetailsUseCase.getProjectSteps(projectId: _project.id);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> loadProjectDetails() async {
    try {
      _project = await _projectDetailsUseCase.getProjectDetails(projectId: _project.id);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> updateProjectDetails({required String newProjectName}) async {
    try {
      await _projectDetailsUseCase.updateProjectDetails(
        projectId: _project.id,
        newTitle: newProjectName,
      );
      // TODO(naz): reload details?
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> deleteProject({required String newProjectName}) async {
    try {
      await _projectDetailsUseCase.deleteProject(projectId: _project.id);
      // TODO(naz): navigate back to home
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> addUser({required String userEmail}) async {
    try {
      await _projectDetailsUseCase.addUserToProject(
        projectId: _project.id,
        userEmail: userEmail,
      );
      // TODO(naz): reload details?
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> deleteUser({required String userEmail}) async {
    try {
      await _projectDetailsUseCase.deleteUserFromProject(
        projectId: _project.id,
        userEmail: userEmail,
      );
      // TODO(naz): reload details?
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;
}
