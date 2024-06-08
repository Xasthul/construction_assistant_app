import 'package:construction_assistant_app/login/utils/entity/login_email_error.dart';
import 'package:construction_assistant_app/login/utils/entity/login_input_state.dart';
import 'package:construction_assistant_app/login/utils/entity/login_password_error.dart';
import 'package:construction_assistant_app/login/utils/validation/login_validation.dart';

class LoginValidator {
  LoginValidation validateLogin({required LoginInputState loginState}) => LoginValidation(
        emailError: _getLoginEmailError(loginState.emailText),
        passwordError: _getLoginPasswordError(loginState.passwordText),
      );

  LoginEmailError _getLoginEmailError(String email) {
    if (email.isEmpty) {
      return LoginEmailError.empty;
    }
    return LoginEmailError.none;
  }

  LoginPasswordError _getLoginPasswordError(String password) {
    if (password.isEmpty) {
      return LoginPasswordError.empty;
    }
    return LoginPasswordError.none;
  }
}
