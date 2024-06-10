import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    required this.oldPasswordText,
    required this.obscureOldPasswordField,
    required this.newPasswordText,
    required this.obscureNewPasswordField,
    required this.confirmPasswordText,
    required this.obscureConfirmPasswordField,
  });

  factory ChangePasswordState.empty() => const ChangePasswordState(
        oldPasswordText: '',
        obscureOldPasswordField: true,
        newPasswordText: '',
        obscureNewPasswordField: true,
        confirmPasswordText: '',
        obscureConfirmPasswordField: true,
      );

  final String oldPasswordText;
  final bool obscureOldPasswordField;
  final String newPasswordText;
  final bool obscureNewPasswordField;
  final String confirmPasswordText;
  final bool obscureConfirmPasswordField;

  ChangePasswordState copyWith({
    String? oldPasswordText,
    bool? obscureOldPasswordField,
    String? newPasswordText,
    bool? obscureNewPasswordField,
    String? confirmPasswordText,
    bool? obscureConfirmPasswordField,
  }) =>
      ChangePasswordState(
        oldPasswordText: oldPasswordText ?? this.oldPasswordText,
        obscureOldPasswordField: obscureOldPasswordField ?? this.obscureOldPasswordField,
        newPasswordText: newPasswordText ?? this.newPasswordText,
        obscureNewPasswordField: obscureNewPasswordField ?? this.obscureNewPasswordField,
        confirmPasswordText: confirmPasswordText ?? this.confirmPasswordText,
        obscureConfirmPasswordField: obscureConfirmPasswordField ?? this.obscureConfirmPasswordField,
      );

  @override
  List<Object> get props => [
        oldPasswordText,
        obscureOldPasswordField,
        newPasswordText,
        obscureNewPasswordField,
        confirmPasswordText,
        obscureConfirmPasswordField,
      ];
}
