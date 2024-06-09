import 'package:construction_assistant_app/app/utils/theme/app_filled_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_snackbar_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_field_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/home_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorTheme {
  AppColorTheme({
    required this.commonColorTheme,
    required this.appTextFieldColorTheme,
    required this.appFilledButtonColorTheme,
    required this.appTextButtonColorTheme,
    required this.appSnackBarColorTheme,
    required this.homeColorTheme,
  });

  factory AppColorTheme.light() => AppColorTheme(
        commonColorTheme: CommonColorTheme.light(),
        appTextFieldColorTheme: AppTextFieldColorTheme.light(),
        appFilledButtonColorTheme: AppFilledButtonColorTheme.light(),
        appTextButtonColorTheme: AppTextButtonColorTheme.light(),
        appSnackBarColorTheme: AppSnackBarColorTheme.light(),
        homeColorTheme: HomeColorTheme.light(),
      );

  final CommonColorTheme commonColorTheme;
  final AppTextFieldColorTheme appTextFieldColorTheme;
  final AppFilledButtonColorTheme appFilledButtonColorTheme;
  final AppTextButtonColorTheme appTextButtonColorTheme;
  final AppSnackBarColorTheme appSnackBarColorTheme;
  final HomeColorTheme homeColorTheme;

  static AppColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme;
}
