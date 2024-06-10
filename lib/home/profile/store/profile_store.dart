import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/profile/utils/use_case/profile_use_case.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/notifier/home_notifier.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  _ProfileStore({required User user}) : _user = user;

  final ProfileUseCase _profileUseCase = getIt<ProfileUseCase>();
  final HomeNotifier _homeNotifier = getIt<HomeStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  User _user;
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @action
  Future<void> load() async {}

  Future<void> _loadUserDetails() async {}

  @action
  Future<void> logout() async => _homeNotifier.logout();

  @action
  void resetErrorMessage() => _errorMessage = null;
}
