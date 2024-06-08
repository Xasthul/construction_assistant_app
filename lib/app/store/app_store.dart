import 'package:construction_assistant_app/app/utils/entity/app_navigation_state.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @readonly
  AppNavigationState _navigationState = AppNavigationState.login;
}
