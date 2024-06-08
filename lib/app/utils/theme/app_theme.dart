import 'package:construction_assistant_app/app/utils/theme/app_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class AppTheme extends InheritedWidget {
  factory AppTheme({required Widget child}) => AppTheme._(
        themeData: AppThemeData.defaultTheme(),
        child: child,
      );

  const AppTheme._({
    required AppThemeData themeData,
    required super.child,
  }) : _appThemeData = themeData;

  final AppThemeData _appThemeData;

  ThemeData get themeData => _appThemeData.themeData;

  AppTextTheme get appTextTheme => _appThemeData.appTextTheme;

  AppColorTheme get appColorTheme => _appThemeData.appColorTheme;

  static AppTheme of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppTheme>()!;

  @override
  bool updateShouldNotify(AppTheme oldWidget) => oldWidget._appThemeData != _appThemeData;
}
