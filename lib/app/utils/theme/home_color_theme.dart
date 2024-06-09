import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:construction_assistant_app/app/utils/theme/profile_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/project_details_color_theme.dart';
import 'package:flutter/material.dart';

class HomeColorTheme {
  HomeColorTheme({
    required this.profileColorTheme,
    required this.projectDetailsColorTheme,
    required this.profileButtonBackgroundColor,
    required this.profileButtonPressedColor,
    required this.profileButtonForegroundColor,
    required this.projectListItemBackgroundColor,
    required this.projectListItemPressedColor,
    required this.projectListItemIconColor,
  });

  factory HomeColorTheme.light() => HomeColorTheme(
        profileColorTheme: ProfileColorTheme.light(),
        projectDetailsColorTheme: ProjectDetailsColorTheme.light(),
        profileButtonBackgroundColor: ColorConstants.primary400,
        profileButtonPressedColor: ColorConstants.primary500,
        profileButtonForegroundColor: ColorConstants.white,
        projectListItemBackgroundColor: ColorConstants.grayscale50,
        projectListItemPressedColor: ColorConstants.grayscale100,
        projectListItemIconColor: ColorConstants.grayscale900,
      );

  final ProfileColorTheme profileColorTheme;
  final ProjectDetailsColorTheme projectDetailsColorTheme;
  final Color profileButtonBackgroundColor;
  final Color profileButtonPressedColor;
  final Color profileButtonForegroundColor;
  final Color projectListItemBackgroundColor;
  final Color projectListItemPressedColor;
  final Color projectListItemIconColor;

  static HomeColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.homeColorTheme;
}
