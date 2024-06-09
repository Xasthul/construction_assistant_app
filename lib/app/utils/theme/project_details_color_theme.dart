import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class ProjectDetailsColorTheme {
  ProjectDetailsColorTheme({
    required this.projectSettingsIconColor,
    required this.projectSettingsDeleteUserIconColor,
  });

  factory ProjectDetailsColorTheme.light() => ProjectDetailsColorTheme(
        projectSettingsIconColor: ColorConstants.grayscale900,
        projectSettingsDeleteUserIconColor: ColorConstants.grayscale900,
      );

  final Color projectSettingsIconColor;
  final Color projectSettingsDeleteUserIconColor;

  static ProjectDetailsColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.homeColorTheme.projectDetailsColorTheme;
}
