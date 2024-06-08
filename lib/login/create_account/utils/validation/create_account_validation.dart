import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_confirm_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_email_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_name_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_password_error.dart';
import 'package:equatable/equatable.dart';

class CreateAccountValidation extends Equatable {
  const CreateAccountValidation({
    required this.nameError,
    required this.emailError,
    required this.passwordError,
    required this.confirmPasswordError,
  });

  factory CreateAccountValidation.empty() => const CreateAccountValidation(
        nameError: CreateAccountNameError.empty,
        emailError: CreateAccountEmailError.empty,
        passwordError: CreateAccountPasswordError.empty,
        confirmPasswordError: CreateAccountConfirmPasswordError.empty,
      );

  final CreateAccountNameError nameError;
  final CreateAccountEmailError emailError;
  final CreateAccountPasswordError passwordError;
  final CreateAccountConfirmPasswordError confirmPasswordError;

  bool get isValid =>
      nameError == CreateAccountNameError.none &&
      emailError == CreateAccountEmailError.none &&
      passwordError == CreateAccountPasswordError.none &&
      confirmPasswordError == CreateAccountConfirmPasswordError.none;

  bool get hasEmptyFields =>
      nameError == CreateAccountNameError.empty ||
      emailError == CreateAccountEmailError.empty ||
      passwordError == CreateAccountPasswordError.empty ||
      confirmPasswordError == CreateAccountConfirmPasswordError.empty;

  CreateAccountValidation copyWith({
    CreateAccountNameError? nameError,
    CreateAccountEmailError? emailError,
    CreateAccountPasswordError? passwordError,
    CreateAccountConfirmPasswordError? confirmPasswordError,
  }) =>
      CreateAccountValidation(
        nameError: nameError ?? this.nameError,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError,
        confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      );

  @override
  List<Object> get props => [
        nameError,
        emailError,
        passwordError,
        confirmPasswordError,
      ];
}
