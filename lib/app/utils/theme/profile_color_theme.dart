import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class ProfileColorTheme {
  ProfileColorTheme({
    required this.circleBackgroundColor,
    required this.circleTextColor,
    required this.selectedButtonColor,
    required this.selectedButtonForegroundColor,
    required this.deleteAccountModalButtonBackgroundColor,
    required this.deleteAccountModalButtonPressedColor,
    required this.versionLabelColor,
    required this.changePasswordDescriptionColor,
  });

  factory ProfileColorTheme.light() => ProfileColorTheme(
        circleBackgroundColor: ColorConstants.primary400,
        circleTextColor: ColorConstants.white,
        selectedButtonColor: ColorConstants.primary500,
        selectedButtonForegroundColor: ColorConstants.white,
        deleteAccountModalButtonBackgroundColor: ColorConstants.error500,
        deleteAccountModalButtonPressedColor: ColorConstants.error600,
        versionLabelColor: ColorConstants.grayscale800,
        changePasswordDescriptionColor: ColorConstants.grayscale400,
      );

  final Color circleBackgroundColor;
  final Color circleTextColor;
  final Color selectedButtonColor;
  final Color selectedButtonForegroundColor;
  final Color deleteAccountModalButtonBackgroundColor;
  final Color deleteAccountModalButtonPressedColor;
  final Color versionLabelColor;
  final Color changePasswordDescriptionColor;

  static ProfileColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.homeColorTheme.profileColorTheme;
}
