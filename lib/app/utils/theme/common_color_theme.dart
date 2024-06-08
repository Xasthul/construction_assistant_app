import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/material.dart';

class CommonColorTheme {
  CommonColorTheme({
    required this.titleTextColor,
  });

  factory CommonColorTheme.light() => CommonColorTheme(
        titleTextColor: ColorConstants.grayscale900,
      );

  final Color titleTextColor;

  static CommonColorTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppTheme>()!.appColorTheme.commonColorTheme;
}
