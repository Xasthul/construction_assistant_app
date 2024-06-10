import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/profile/utils/entity/change_password_state.dart';
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
  ChangePasswordState _changePasswordState = ChangePasswordState.empty();
  @readonly
  bool _isEditNameSuccessful = false;
  @readonly
  bool _isChangePasswordSuccessful = false;
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get isUpdateNameButtonEnabled => _newUserName.isNotEmpty;

  @computed
  bool get isOldPasswordEmpty => _changePasswordState.oldPasswordText.isEmpty;

  @computed
  bool get isNewPasswordEmpty => _changePasswordState.newPasswordText.isEmpty;

  @computed
  bool get isConfirmPasswordEmpty => _changePasswordState.confirmPasswordText.isEmpty;

  @computed
  bool get isSaveChangePasswordButtonEnabled => !isOldPasswordEmpty && !isNewPasswordEmpty && !isConfirmPasswordEmpty;

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
  void updateChangePasswordState({
    String? oldPasswordText,
    String? newPasswordText,
    String? confirmPasswordText,
  }) =>
      _changePasswordState = _changePasswordState.copyWith(
        oldPasswordText: oldPasswordText,
        newPasswordText: newPasswordText,
        confirmPasswordText: confirmPasswordText,
      );

  @action
  void toggleObscureOldPasswordField({required String text}) {
    if (text.isNotEmpty) {
      _changePasswordState = _changePasswordState.copyWith(
        obscureOldPasswordField: !_changePasswordState.obscureOldPasswordField,
      );
    }
  }

  @action
  void toggleObscureNewPasswordField({required String text}) {
    if (text.isNotEmpty) {
      _changePasswordState = _changePasswordState.copyWith(
        obscureNewPasswordField: !_changePasswordState.obscureNewPasswordField,
      );
    }
  }

  @action
  void toggleObscureConfirmPasswordField({required String text}) {
    if (text.isNotEmpty) {
      _changePasswordState = _changePasswordState.copyWith(
        obscureConfirmPasswordField: !_changePasswordState.obscureConfirmPasswordField,
      );
    }
  }

  @action
  Future<void> updatePassword() async {
    try {
      // TODO(naz): handle new password is the same as old
      await _profileUseCase.updateUserPassword(
        oldPassword: _changePasswordState.oldPasswordText,
        newPassword: _changePasswordState.newPasswordText,
      );
      _isChangePasswordSuccessful = true;
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
  void resetIsChangePasswordSuccessful() => _isChangePasswordSuccessful = false;

  @action
  void resetChangePasswordState() => _changePasswordState = ChangePasswordState.empty();

  @action
  void resetErrorMessage() => _errorMessage = null;
}
