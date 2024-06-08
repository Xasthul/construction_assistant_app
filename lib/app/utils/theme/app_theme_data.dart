import 'package:construction_assistant_app/app/utils/theme/app_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({
    required this.themeData,
    required this.appTextTheme,
    required this.appColorTheme,
  });

  factory AppThemeData.defaultTheme() => AppThemeData(
        themeData: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: ColorConstants.white,
          dividerTheme: DividerThemeData(
            color: ColorConstants.grayscale50,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: ColorConstants.white,
            surfaceTintColor: ColorConstants.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 16),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          snackBarTheme: const SnackBarThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorConstants.primary500,
            selectionColor: ColorConstants.primary500.withOpacity(0.2),
            selectionHandleColor: ColorConstants.primary500,
          ),
          // NOTE: in order to change cursorHandleColor for iOS
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: ColorConstants.primary500,
          ),
          switchTheme: SwitchThemeData(
            thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return ColorConstants.white;
                }
                return ColorConstants.grayscale100;
              }
              if (states.contains(WidgetState.selected)) {
                return ColorConstants.white;
              }
              return ColorConstants.grayscale600;
            }),
            trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return ColorConstants.grayscale100;
                }
                return ColorConstants.grayscale50;
              }
              if (states.contains(WidgetState.selected)) {
                return ColorConstants.primary500;
              }
              return ColorConstants.grayscale50;
            }),
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return ColorConstants.grayscale100;
                }
                return ColorConstants.grayscale100;
              }
              if (states.contains(WidgetState.selected)) {
                return ColorConstants.primary500;
              }
              return ColorConstants.grayscale600;
            }),
            // NOTE: Need to specify icon with the same color as thumb,
            // so that thumb in unchecked state is the same size as in checked state, as required by designs
            thumbIcon: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                if (states.contains(WidgetState.selected)) {
                  return Icon(Icons.add, color: ColorConstants.white);
                }
                return Icon(Icons.add, color: ColorConstants.grayscale100);
              }
              if (states.contains(WidgetState.selected)) {
                return Icon(Icons.add, color: ColorConstants.white);
              }
              return Icon(Icons.add, color: ColorConstants.grayscale600);
            }),
          ),
          // NOTE: Required to fix buttons overlay color glitches during navigations
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(
                allowEnterRouteSnapshotting: false,
              ),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        appTextTheme: AppTextTheme.defaultTextTheme(),
        appColorTheme: AppColorTheme.light(),
      );

  final ThemeData themeData;
  final AppTextTheme appTextTheme;
  final AppColorTheme appColorTheme;
}
