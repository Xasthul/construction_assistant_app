import 'package:construction_assistant_app/app/utils/theme/app_filled_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_field_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorTheme {
  AppColorTheme({
    required this.commonColorTheme,
    required this.appTextFieldColorTheme,
    required this.appFilledButtonColorTheme,
  });

  factory AppColorTheme.light() => AppColorTheme(
        commonColorTheme: CommonColorTheme.light(),
        appTextFieldColorTheme: AppTextFieldColorTheme.light(),
        appFilledButtonColorTheme: AppFilledButtonColorTheme.light(),
      );

  final CommonColorTheme commonColorTheme;
  final AppTextFieldColorTheme appTextFieldColorTheme;
  final AppFilledButtonColorTheme appFilledButtonColorTheme;

  static AppColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme;
}
