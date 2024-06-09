import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/store/app_store.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/home/profile/utils/use_case/profile_use_case.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final ProfileUseCase _profileUseCase = getIt<ProfileUseCase>();
  final AppNavigationStateNotifier _appNavigationStateNotifier = getIt<AppStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @action
  Future<void> logout() async {
    _isLoading = true;
    try {
      await _profileUseCase.logout();
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
