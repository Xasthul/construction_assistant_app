import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/use_case/home_use_case.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final HomeUseCase _homeUseCase = getIt<HomeUseCase>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  List<Project> _projects = [];
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @action
  Future<void> load() async => _loadProjects();

  Future<void> _loadProjects() async {
    _isLoading = true;
    try {
      _projects = await _homeUseCase.loadProjects();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> createProject({required String projectName}) async {
    _isLoading = true;
    try {
      // TODO(naz): implement
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;
}
