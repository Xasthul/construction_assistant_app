import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTextFieldColorTheme {
  AppTextFieldColorTheme({
    required this.fillColor,
    required this.titleColor,
    required this.textColor,
    required this.suffixTextColor,
    required this.errorTextColor,
    required this.borderColor,
    required this.errorBorderColor,
    required this.hintTextColor,
    required this.helperTextColor,
    required this.defaultIconColor,
    required this.filledIconColor,
    required this.errorIconColor,
  });

  factory AppTextFieldColorTheme.light() => AppTextFieldColorTheme(
        fillColor: ColorConstants.white,
        titleColor: ColorConstants.grayscale900,
        textColor: ColorConstants.grayscale900,
        suffixTextColor: ColorConstants.grayscale500,
        errorTextColor: ColorConstants.error500,
        borderColor: ColorConstants.grayscale100,
        errorBorderColor: ColorConstants.error200,
        hintTextColor: ColorConstants.grayscale400,
        helperTextColor: ColorConstants.grayscale400,
        defaultIconColor: ColorConstants.grayscale400,
        filledIconColor: ColorConstants.grayscale900,
        errorIconColor: ColorConstants.error500,
      );

  final Color fillColor;
  final Color titleColor;
  final Color textColor;
  final Color suffixTextColor;
  final Color errorTextColor;
  final Color borderColor;
  final Color errorBorderColor;
  final Color hintTextColor;
  final Color helperTextColor;
  final Color defaultIconColor;
  final Color filledIconColor;
  final Color errorIconColor;

  static AppTextFieldColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.appTextFieldColorTheme;
}
