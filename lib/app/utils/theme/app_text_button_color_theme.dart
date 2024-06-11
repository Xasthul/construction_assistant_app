import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTextButtonColorTheme {
  AppTextButtonColorTheme({
    required this.foregroundColor,
    required this.pressedForegroundColor,
    required this.overlayColor,
    required this.disabledColor,
  });

  factory AppTextButtonColorTheme.light() => AppTextButtonColorTheme(
        foregroundColor: ColorConstants.primary500,
        pressedForegroundColor: ColorConstants.primary700,
        overlayColor: ColorConstants.transparent,
        disabledColor: ColorConstants.grayscale200,
      );

  final Color foregroundColor;
  final Color pressedForegroundColor;
  final Color overlayColor;
  final Color disabledColor;

  static AppTextButtonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme.appTextButtonColorTheme;
}
