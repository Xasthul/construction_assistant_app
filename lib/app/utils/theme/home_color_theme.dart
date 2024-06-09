import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:construction_assistant_app/app/utils/theme/profile_color_theme.dart';
import 'package:flutter/material.dart';

class HomeColorTheme {
  HomeColorTheme({
    required this.profileColorTheme,
    required this.profileButtonBackgroundColor,
    required this.profileButtonPressedColor,
    required this.profileButtonForegroundColor,
    required this.changeChargerIconBackgroundColor,
    required this.activeChargerLabelColor,
  });

  factory HomeColorTheme.light() => HomeColorTheme(
        profileColorTheme: ProfileColorTheme.light(),
        profileButtonBackgroundColor: ColorConstants.primary400,
        profileButtonPressedColor: ColorConstants.primary500,
        profileButtonForegroundColor: ColorConstants.white,
        changeChargerIconBackgroundColor: ColorConstants.grayscale50,
        activeChargerLabelColor: ColorConstants.grayscale300,
      );

  final ProfileColorTheme profileColorTheme;
  final Color profileButtonBackgroundColor;
  final Color profileButtonPressedColor;
  final Color profileButtonForegroundColor;
  final Color changeChargerIconBackgroundColor;
  final Color activeChargerLabelColor;

  static HomeColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.homeColorTheme;
}
