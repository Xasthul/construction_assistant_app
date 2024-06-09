import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/app/utils/entity/app_navigation_state.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store, AppNavigationStateNotifier {
  final SecureStorage _secureStorage = getIt<SecureStorage>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  AppNavigationState _navigationState = AppNavigationState.login;
  @readonly
  bool _isLoading = false;

  @action
  Future<void> load() async => updateNavigationState();

  @override
  @action
  Future<void> updateNavigationState() async {
    _isLoading = true;
    try {
      final accessToken = await _secureStorage.readAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        _navigationState = AppNavigationState.home;
        return;
      }
      _navigationState = AppNavigationState.login;
    } catch (error) {
      _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }
}
