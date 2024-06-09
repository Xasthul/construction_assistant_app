import 'package:construction_assistant_app/app/utils/theme/app_filled_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_snackbar_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_field_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class CommonColorTheme {
  CommonColorTheme({
    required this.appTextFieldColorTheme,
    required this.appFilledButtonColorTheme,
    required this.appTextButtonColorTheme,
    required this.appSnackBarColorTheme,
    required this.titleTextColor,
    required this.labelTextColor,
    required this.circularProgressIndicatorColor,
    required this.appBarBackButtonColor,
  });

  factory CommonColorTheme.light() => CommonColorTheme(
        appTextFieldColorTheme: AppTextFieldColorTheme.light(),
        appFilledButtonColorTheme: AppFilledButtonColorTheme.light(),
        appTextButtonColorTheme: AppTextButtonColorTheme.light(),
        appSnackBarColorTheme: AppSnackBarColorTheme.light(),
        titleTextColor: ColorConstants.grayscale900,
        labelTextColor: ColorConstants.grayscale600,
        circularProgressIndicatorColor: ColorConstants.primary500,
        appBarBackButtonColor: ColorConstants.grayscale900,
      );

  final AppTextFieldColorTheme appTextFieldColorTheme;
  final AppFilledButtonColorTheme appFilledButtonColorTheme;
  final AppTextButtonColorTheme appTextButtonColorTheme;
  final AppSnackBarColorTheme appSnackBarColorTheme;
  final Color titleTextColor;
  final Color labelTextColor;
  final Color circularProgressIndicatorColor;
  final Color appBarBackButtonColor;

  static CommonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme;
}
