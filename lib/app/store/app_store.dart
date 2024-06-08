import 'package:construction_assistant_app/app/utils/entity/app_navigation_state.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store, AppNavigationStateNotifier {
  @readonly
  AppNavigationState _navigationState = AppNavigationState.login;

  @override
  Future<void> updateNavigationState() async {}
}
