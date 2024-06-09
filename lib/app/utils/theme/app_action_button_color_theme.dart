import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppActionButtonColorTheme {
  AppActionButtonColorTheme({
    required this.defaultBackgroundColor,
    required this.defaultPressedColor,
    required this.defaultIconColor,
  });

  factory AppActionButtonColorTheme.light() => AppActionButtonColorTheme(
        defaultBackgroundColor: ColorConstants.grayscale50,
        defaultPressedColor: ColorConstants.grayscale100,
        defaultIconColor: ColorConstants.grayscale900,
      );

  final Color defaultBackgroundColor;
  final Color defaultPressedColor;
  final Color defaultIconColor;

  static AppActionButtonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme.appActionButtonColorTheme;
}
