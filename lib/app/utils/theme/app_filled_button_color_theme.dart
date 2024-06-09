import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppFilledButtonColorTheme {
  AppFilledButtonColorTheme({
    required this.filledButtonDefaultColor,
    required this.filledButtonLoadingColor,
    required this.filledButtonPressedColor,
    required this.filledButtonDisabledColor,
    required this.filledButtonDefaultForegroundColor,
    required this.filledButtonDisabledForegroundColor,
  });

  factory AppFilledButtonColorTheme.light() => AppFilledButtonColorTheme(
        filledButtonDefaultColor: ColorConstants.primary500,
        filledButtonLoadingColor: ColorConstants.primary700,
        filledButtonPressedColor: ColorConstants.primary700,
        filledButtonDisabledColor: ColorConstants.grayscale50,
        filledButtonDefaultForegroundColor: ColorConstants.white,
        filledButtonDisabledForegroundColor: ColorConstants.grayscale300,
      );

  final Color filledButtonDefaultColor;
  final Color filledButtonLoadingColor;
  final Color filledButtonPressedColor;
  final Color filledButtonDisabledColor;
  final Color filledButtonDefaultForegroundColor;
  final Color filledButtonDisabledForegroundColor;

  static AppFilledButtonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme.appFilledButtonColorTheme;
}
