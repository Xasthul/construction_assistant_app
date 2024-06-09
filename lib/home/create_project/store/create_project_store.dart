import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/notifier/home_notifier.dart';
import 'package:construction_assistant_app/home/utils/use_case/home_use_case.dart';
import 'package:mobx/mobx.dart';

part 'create_project_store.g.dart';

class CreateProjectStore = _CreateProjectStore with _$CreateProjectStore;

abstract class _CreateProjectStore with Store {
  final HomeUseCase _homeUseCase = getIt<HomeUseCase>();
  final HomeNotifier _homeNotifier = getIt<HomeStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  bool _isProjectCreatedSuccessfully = false;
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @action
  Future<void> createProject({required String projectName}) async {
    _isLoading = true;
    try {
      await _homeUseCase.createProject(projectName: projectName);
      await _homeNotifier.loadProjects();
      _isProjectCreatedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;

  @action
  void resetIsProjectCreatedSuccessfully() => _isProjectCreatedSuccessfully = false;
}
