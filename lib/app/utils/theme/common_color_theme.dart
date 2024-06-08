import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class CommonColorTheme {
  CommonColorTheme({
    required this.titleTextColor,
    required this.labelTextColor,
    required this.circularProgressIndicatorColor,
  });

  factory CommonColorTheme.light() => CommonColorTheme(
        titleTextColor: ColorConstants.grayscale900,
        labelTextColor: ColorConstants.grayscale600,
        circularProgressIndicatorColor: ColorConstants.primary500,
      );

  final Color titleTextColor;
  final Color labelTextColor;
  final Color circularProgressIndicatorColor;

  static CommonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme;
}
