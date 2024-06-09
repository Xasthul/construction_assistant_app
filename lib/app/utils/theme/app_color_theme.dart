import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/home_color_theme.dart';
import 'package:flutter/material.dart';

class AppColorTheme {
  AppColorTheme({
    required this.commonColorTheme,
    required this.homeColorTheme,
  });

  factory AppColorTheme.light() => AppColorTheme(
        commonColorTheme: CommonColorTheme.light(),
        homeColorTheme: HomeColorTheme.light(),
      );

  final CommonColorTheme commonColorTheme;
  final HomeColorTheme homeColorTheme;

  static AppColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme;
}
