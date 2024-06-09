import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/project_details/utils/use_case/project_details_use_case.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/notifier/home_notifier.dart';
import 'package:mobx/mobx.dart';

part 'project_details_store.g.dart';

class ProjectDetailsStore = _ProjectDetailsStore with _$ProjectDetailsStore;

abstract class _ProjectDetailsStore with Store {
  _ProjectDetailsStore({required Project project}) : _project = project;

  final ProjectDetailsUseCase _projectDetailsUseCase = getIt<ProjectDetailsUseCase>();
  final HomeNotifier _homeNotifier = getIt<HomeStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  Project _project;
  @readonly
  List<Step> _steps = [];
  @readonly
  String _newProjectName = '';
  @readonly
  bool _isProjectRenamedSuccessfully = false;
  @readonly
  bool _isProjectDeletedSuccessfully = false;
  @readonly
  bool _isAddUserSuccessful = false;
  @readonly
  String _addUserEmail = '';
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  int get stepsCount => _steps.length;

  @computed
  int get usersCount => _project.users.length;

  @computed
  bool get isUpdateProjectNameButtonEnabled => _newProjectName.isNotEmpty;

  @computed
  bool get isAddUserButtonEnabled => _addUserEmail.isNotEmpty;

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
  Future<void> _loadProjectDetails() async {
    try {
      _project = await _projectDetailsUseCase.getProjectDetails(projectId: _project.id);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> updateProjectName() async {
    try {
      if (_project.title == _newProjectName) {
        _isProjectRenamedSuccessfully = true;
        return;
      }
      await _projectDetailsUseCase.updateProjectDetails(
        projectId: _project.id,
        newTitle: _newProjectName,
      );
      await _loadProjectDetails();
      await _homeNotifier.loadProjects();
      _isProjectRenamedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> deleteProject() async {
    try {
      await _projectDetailsUseCase.deleteProject(projectId: _project.id);
      await _homeNotifier.loadProjects();
      _isProjectDeletedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> addUser() async {
    try {
      await _projectDetailsUseCase.addUserToProject(
        projectId: _project.id,
        userEmail: _addUserEmail,
      );
      await _loadProjectDetails();
      await _homeNotifier.loadProjects();
      _isAddUserSuccessful = true;
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
      await _loadProjectDetails();
      await _homeNotifier.loadProjects();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void updateNewProjectName(String newName) => _newProjectName = newName;

  @action
  void resetNewProjectName() => _newProjectName = '';

  @action
  void updateAddUserEmail(String email) => _addUserEmail = email;

  @action
  void resetAddUserEmail() => _addUserEmail = '';

  @action
  void resetIsProjectRenamedSuccessfully() => _isProjectRenamedSuccessfully = false;

  @action
  void resetIsProjectDeletedSuccessfully() => _isProjectDeletedSuccessfully = false;

  @action
  void resetIsAddUserSuccessful() => _isAddUserSuccessful = false;

  @action
  void resetErrorMessage() => _errorMessage = null;
}
