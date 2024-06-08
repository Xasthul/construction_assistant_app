import 'package:construction_assistant_app/login/utils/entity/login_email_error.dart';
import 'package:construction_assistant_app/login/utils/entity/login_password_error.dart';
import 'package:equatable/equatable.dart';

class LoginValidation extends Equatable {
  const LoginValidation({
    required this.emailError,
    required this.passwordError,
  });

  factory LoginValidation.empty() => const LoginValidation(
        emailError: LoginEmailError.empty,
        passwordError: LoginPasswordError.empty,
      );

  final LoginEmailError emailError;
  final LoginPasswordError passwordError;

  bool get isValid => emailError == LoginEmailError.none && passwordError == LoginPasswordError.none;

  bool get hasEmptyFields => emailError == LoginEmailError.empty || passwordError == LoginPasswordError.empty;

  LoginValidation copyWith({
    LoginEmailError? emailError,
    LoginPasswordError? passwordError,
  }) =>
      LoginValidation(
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
      );

  @override
  List<Object> get props => [
        emailError,
        passwordError,
      ];
}
