import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorTheme {
  AppColorTheme({
    required this.commonColorTheme,
  });

  factory AppColorTheme.light() => AppColorTheme(
        commonColorTheme: CommonColorTheme.light(),
      );

  final CommonColorTheme commonColorTheme;

  static AppColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme;
}
