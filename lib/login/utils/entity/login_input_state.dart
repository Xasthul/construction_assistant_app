import 'package:equatable/equatable.dart';

class LoginInputState extends Equatable {
  const LoginInputState({
    required this.emailText,
    required this.passwordText,
  });

  factory LoginInputState.empty() => const LoginInputState(
        emailText: '',
        passwordText: '',
      );

  final String emailText;
  final String passwordText;

  LoginInputState copyWith({
    String? emailText,
    String? passwordText,
  }) =>
      LoginInputState(
        emailText: emailText ?? this.emailText,
        passwordText: passwordText ?? this.passwordText,
      );

  @override
  List<Object> get props => [
        emailText,
        passwordText,
      ];
}
