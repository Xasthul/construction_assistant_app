import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_confirm_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_email_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_name_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_state.dart';
import 'package:construction_assistant_app/login/create_account/utils/formatter/create_account_error_formatter.dart';
import 'package:construction_assistant_app/login/create_account/utils/validation/create_account_validation.dart';
import 'package:construction_assistant_app/login/create_account/utils/validation/create_account_validator.dart';
import 'package:construction_assistant_app/login/utils/use_case/login_use_case.dart';
import 'package:mobx/mobx.dart';

part 'create_account_store.g.dart';

class CreateAccountStore = _CreateAccountStore with _$CreateAccountStore;

abstract class _CreateAccountStore with Store {
  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();
  final CreateAccountValidator _createAccountValidator = getIt<CreateAccountValidator>();
  final CreateAccountErrorFormatter _createAccountErrorFormatter = getIt<CreateAccountErrorFormatter>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();
  final AppNavigationStateNotifier _appNavigationStateNotifier = getIt<AppNavigationStateNotifier>();

  @readonly
  CreateAccountState _createAccountState = CreateAccountState.empty();
  @readonly
  CreateAccountValidation _emptyFieldsValidation = CreateAccountValidation.empty();
  @readonly
  CreateAccountValidation _createAccountValidation = CreateAccountValidation.empty();
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get shouldEnableSignUpButton => !_emptyFieldsValidation.hasEmptyFields;

  @computed
  bool get isPasswordEmpty => _createAccountState.passwordText.isEmpty;

  @computed
  bool get isConfirmPasswordEmpty => _createAccountState.confirmPasswordText.isEmpty;

  @computed
  String? get nameError => _createAccountErrorFormatter.getNameErrorStringFrom(
        _createAccountValidation.nameError,
      );

  @computed
  String? get emailError => _createAccountErrorFormatter.getEmailErrorStringFrom(
        _createAccountValidation.emailError,
      );

  @computed
  String? get passwordError => _createAccountErrorFormatter.getPasswordErrorStringFrom(
        _createAccountValidation.passwordError,
      );

  @computed
  String? get confirmPasswordError => _createAccountErrorFormatter.getConfirmPasswordErrorStringFrom(
        _createAccountValidation.confirmPasswordError,
      );

  @action
  void toggleObscurePasswordField({required String text}) {
    if (text.isNotEmpty) {
      _createAccountState = _createAccountState.copyWith(
        obscurePasswordField: !_createAccountState.obscurePasswordField,
      );
    }
  }

  @action
  void toggleObscureConfirmPasswordField({required String text}) {
    if (text.isNotEmpty) {
      _createAccountState = _createAccountState.copyWith(
        obscureConfirmPasswordField: !_createAccountState.obscureConfirmPasswordField,
      );
    }
  }

  @action
  void updateCreateAccountState({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    _createAccountState = _createAccountState.copyWith(
      nameText: name,
      emailText: email,
      passwordText: password,
      confirmPasswordText: confirmPassword,
    );
    _checkIfHasEmptyFields();
  }

  void _checkIfHasEmptyFields() => _emptyFieldsValidation = _createAccountValidator.validate(
        createAccountState: _createAccountState,
      );

  Future<void> signUpButtonClicked() async {
    _validateCreateAccountState();
    if (!_createAccountValidation.isValid) {
      return;
    }
    _isLoading = true;
    try {
      await _loginUseCase.signUp(
        name: _createAccountState.nameText,
        email: _createAccountState.emailText,
        password: _createAccountState.passwordText,
      );
      await _loginUseCase.login(
        email: _createAccountState.emailText,
        password: _createAccountState.passwordText,
      );
      await _appNavigationStateNotifier.updateNavigationState();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  void _validateCreateAccountState() => _createAccountValidation = _createAccountValidator.validate(
        createAccountState: _createAccountState,
      );

  @action
  void clearNameError() => _createAccountValidation = _createAccountValidation.copyWith(
        nameError: CreateAccountNameError.none,
      );

  @action
  void clearEmailError() => _createAccountValidation = _createAccountValidation.copyWith(
        emailError: CreateAccountEmailError.none,
      );

  @action
  void clearPasswordError() => _createAccountValidation = _createAccountValidation.copyWith(
        passwordError: CreateAccountPasswordError.none,
      );

  @action
  void clearConfirmPasswordError() => _createAccountValidation = _createAccountValidation.copyWith(
        confirmPasswordError: CreateAccountConfirmPasswordError.none,
      );

  @action
  void handleErrorMessage() => _errorMessage = null;
}
