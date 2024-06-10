import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/store/app_store.dart';
import 'package:construction_assistant_app/app/utils/core/core_error.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/notifier/home_notifier.dart';
import 'package:construction_assistant_app/home/utils/use_case/home_use_case.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store, HomeNotifier {
  final HomeUseCase _homeUseCase = getIt<HomeUseCase>();
  final AppNavigationStateNotifier _appNavigationStateNotifier = getIt<AppStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  User? _user;
  @readonly
  List<Project> _projects = [];
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  int get projectsCount => _projects.length;

  @computed
  String get userName => _user?.name ?? '';

  @computed
  String get userNameFirstCharacter => userName.isNotEmpty //
      ? userName[0]
      : '';

  @action
  Future<void> load() async {
    await loadUserDetails();
    await loadProjects();
  }

  @override
  @action
  Future<void> loadUserDetails() async {
    _isLoading = true;
    try {
      _user = await _homeUseCase.getUserDetails();
    } on CoreInvalidAccessTokenError catch (error) {
      await logout();
      _errorMessage = _coreErrorFormatter.formatError(error);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @override
  @action
  Future<void> loadProjects() async {
    _isLoading = true;
    try {
      _projects = await _homeUseCase.loadProjects();
    } on CoreInvalidAccessTokenError catch (error) {
      await logout();
      _errorMessage = _coreErrorFormatter.formatError(error);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @override
  @action
  Future<void> logout() async {
    _isLoading = true;
    try {
      await _homeUseCase.logout();
      await _appNavigationStateNotifier.updateNavigationState();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;
}
