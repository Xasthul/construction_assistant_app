import 'package:construction_assistant_app/app/utils/entity/app_regular_expressions.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_confirm_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_email_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_name_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_state.dart';
import 'package:construction_assistant_app/login/create_account/utils/validation/create_account_validation.dart';

class CreateAccountValidator {
  CreateAccountValidation validate({required CreateAccountState createAccountState}) => CreateAccountValidation(
        nameError: _getNameError(createAccountState.nameText),
        emailError: _getEmailError(createAccountState.emailText),
        passwordError: _getPasswordError(createAccountState.passwordText),
        confirmPasswordError: _getConfirmPasswordError(
          confirmPassword: createAccountState.confirmPasswordText,
          password: createAccountState.passwordText,
        ),
      );

  CreateAccountNameError _getNameError(String name) {
    if (name.isEmpty) {
      return CreateAccountNameError.empty;
    }
    if (!AppRegularExpressions.nameValidationRegExp.hasMatch(name)) {
      return CreateAccountNameError.invalid;
    }
    return CreateAccountNameError.none;
  }

  CreateAccountEmailError _getEmailError(String email) {
    if (email.isEmpty) {
      return CreateAccountEmailError.empty;
    }
    if (!AppRegularExpressions.emailValidationRegExp.hasMatch(email)) {
      return CreateAccountEmailError.invalid;
    }
    return CreateAccountEmailError.none;
  }

  CreateAccountPasswordError _getPasswordError(String password) {
    if (password.isEmpty) {
      return CreateAccountPasswordError.empty;
    }
    if (!AppRegularExpressions.passwordValidationRegExp.hasMatch(password)) {
      return CreateAccountPasswordError.invalid;
    }
    return CreateAccountPasswordError.none;
  }

  CreateAccountConfirmPasswordError _getConfirmPasswordError({
    required String confirmPassword,
    required String password,
  }) {
    if (confirmPassword.isEmpty) {
      return CreateAccountConfirmPasswordError.empty;
    }
    if (confirmPassword != password) {
      return CreateAccountConfirmPasswordError.notMatched;
    }
    return CreateAccountConfirmPasswordError.none;
  }
}
