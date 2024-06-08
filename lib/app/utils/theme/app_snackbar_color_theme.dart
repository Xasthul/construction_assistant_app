import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppSnackBarColorTheme {
  AppSnackBarColorTheme({
    required this.snackBarAlertColor,
    required this.snackBarAlertTextColor,
    required this.snackBarErrorColor,
    required this.snackBarErrorTextColor,
    required this.snackBarErrorBodyTextColor,
  });

  factory AppSnackBarColorTheme.light() => AppSnackBarColorTheme(
        snackBarAlertColor: ColorConstants.primary500,
        snackBarAlertTextColor: ColorConstants.white,
        snackBarErrorColor: ColorConstants.error500,
        snackBarErrorTextColor: ColorConstants.white,
        snackBarErrorBodyTextColor: ColorConstants.white.withOpacity(0.8),
      );

  final Color snackBarAlertColor;
  final Color snackBarAlertTextColor;
  final Color snackBarErrorColor;
  final Color snackBarErrorTextColor;
  final Color snackBarErrorBodyTextColor;

  static AppSnackBarColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.appSnackBarColorTheme;
}
