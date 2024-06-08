import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/home/formatter/home_error_formatter.dart';
import 'package:construction_assistant_app/home/use_case/home_use_case.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final HomeUseCase _homeUseCase = getIt<HomeUseCase>();
  final AppNavigationStateNotifier _appNavigationStateNotifier = getIt<AppNavigationStateNotifier>();
  final HomeErrorFormatter _homeErrorFormatter = getIt<HomeErrorFormatter>();

  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @action
  Future<void> logout() async {
    _isLoading = true;
    try {
      await _homeUseCase.logout();
      await _appNavigationStateNotifier.updateNavigationState();
    } catch (error) {
      _errorMessage = _homeErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;
}
