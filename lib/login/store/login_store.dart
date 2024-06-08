import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/login/utils/entity/login_input_state.dart';
import 'package:construction_assistant_app/login/utils/formatter/login_error_formatter.dart';
import 'package:construction_assistant_app/login/utils/use_case/login_use_case.dart';
import 'package:construction_assistant_app/login/utils/validation/login_validation.dart';
import 'package:construction_assistant_app/login/utils/validation/login_validator.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();
  final LoginValidator _loginValidator = getIt<LoginValidator>();
  final LoginErrorFormatter _loginErrorFormatter = getIt<LoginErrorFormatter>();
  final AppNavigationStateNotifier _appNavigationStateNotifier = getIt<AppNavigationStateNotifier>();

  @readonly
  LoginInputState _loginState = LoginInputState.empty();
  @readonly
  LoginValidation _loginValidation = LoginValidation.empty();
  @readonly
  bool _obscurePasswordField = true;
  @readonly
  bool _isLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get shouldEnableContinueButton => _loginValidation.isValid;

  @computed
  bool get isPasswordEmpty => _loginState.passwordText.isEmpty;

  @action
  void toggleObscurePasswordField({required String controllerText}) {
    if (controllerText.isNotEmpty) {
      _obscurePasswordField = !_obscurePasswordField;
    }
  }

  @action
  void updateLoginState({
    String? email,
    String? password,
  }) {
    _loginState = _loginState.copyWith(
      emailText: email,
      passwordText: password,
    );
    _validateLoginState();
  }

  void _validateLoginState() => _loginValidation = _loginValidator.validate(loginState: _loginState);

  @action
  Future<void> continueButtonClicked() async {
    _isLoading = true;
    try {
      await _loginUseCase.login(
        email: _loginState.emailText,
        password: _loginState.passwordText,
      );
      await _appNavigationStateNotifier.updateNavigationState();
    } catch (error) {
      _errorMessage = _loginErrorFormatter.formatError(error);
    } finally {
      _isLoading = false;
    }
  }

  @action
  void handleErrorMessage() => _errorMessage = null;
}
