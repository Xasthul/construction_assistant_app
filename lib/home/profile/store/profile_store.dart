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
  String _newUserName = '';
  @readonly
  bool _isEditNameSuccessful = false;
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get isUpdateNameButtonEnabled => _newUserName.isNotEmpty;

  @action
  Future<void> load() async {}

  @action
  Future<void> _loadUserDetails() async {
    try {
      _user = await _profileUseCase.getUserDetails();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void updateNewUserName(String newName) => _newUserName = newName;

  @action
  Future<void> updateUserName() async {
    if (_newUserName == _user.name) {
      _isEditNameSuccessful = true;
      return;
    }
    try {
      await _profileUseCase.updateUserName(newName: _newUserName);
      await _loadUserDetails();
      await _homeNotifier.loadUserDetails();
      _isEditNameSuccessful = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> logout() async {
    try {
      await _profileUseCase.logout();
      await _homeNotifier.logout();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> deleteAccount() async {
    try {
      await _profileUseCase.deleteAccount();
      await _homeNotifier.logout();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void resetIsEditNameSuccessful() => _isEditNameSuccessful = false;

  @action
  void resetErrorMessage() => _errorMessage = null;
}
