import 'package:equatable/equatable.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    required this.nameText,
    required this.emailText,
    required this.passwordText,
    required this.obscurePasswordField,
    required this.confirmPasswordText,
    required this.obscureConfirmPasswordField,
  });

  factory CreateAccountState.empty() => const CreateAccountState(
        nameText: '',
        emailText: '',
        passwordText: '',
        obscurePasswordField: true,
        confirmPasswordText: '',
        obscureConfirmPasswordField: true,
      );

  final String nameText;
  final String emailText;
  final String passwordText;
  final bool obscurePasswordField;
  final String confirmPasswordText;
  final bool obscureConfirmPasswordField;

  CreateAccountState copyWith({
    String? nameText,
    String? emailText,
    String? passwordText,
    bool? obscurePasswordField,
    String? confirmPasswordText,
    bool? obscureConfirmPasswordField,
  }) =>
      CreateAccountState(
        nameText: nameText ?? this.nameText,
        emailText: emailText ?? this.emailText,
        passwordText: passwordText ?? this.passwordText,
        obscurePasswordField: obscurePasswordField ?? this.obscurePasswordField,
        confirmPasswordText: confirmPasswordText ?? this.confirmPasswordText,
        obscureConfirmPasswordField: obscureConfirmPasswordField ?? this.obscureConfirmPasswordField,
      );

  @override
  List<Object> get props => [
        nameText,
        emailText,
        passwordText,
        obscurePasswordField,
        confirmPasswordText,
        obscureConfirmPasswordField,
      ];
}
