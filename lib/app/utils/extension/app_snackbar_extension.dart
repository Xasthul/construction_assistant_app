import 'package:construction_assistant_app/app/utils/component/app_snackbar_content_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_snackbar_color_theme.dart';
import 'package:flutter/material.dart';

extension AppSnackBarExtension on ScaffoldMessengerState {
  void showAppSnackBar({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color titleColor,
    double? bottomPadding,
    String? body,
    Color? bodyColor,
    String? buttonText,
    VoidCallback? onPressed,
    bool shouldHideKeyboard = false,
  }) {
    if (shouldHideKeyboard) {
      _hideKeyboard();
    }
    hideCurrentSnackBar();
    showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: AppSnackBarContentComponent(
          title: title,
          body: body,
          bodyTextColor: bodyColor,
          icon: icon,
          titleColor: titleColor,
          bottomPadding: bottomPadding ?? 44,
          buttonText: buttonText,
          onPressed: onPressed,
        ),
      ),
    );
  }

  void showAppErrorSnackBar({
    required BuildContext context,
    required String title,
    String? body,
    bool shouldHideKeyboard = false,
  }) {
    if (shouldHideKeyboard) {
      _hideKeyboard();
    }
    hideCurrentSnackBar();
    showSnackBar(
      SnackBar(
        backgroundColor: AppSnackBarColorTheme.of(context).snackBarErrorColor,
        content: AppSnackBarContentComponent(
          title: title,
          body: body,
          bodyTextColor: AppSnackBarColorTheme.of(context).snackBarErrorBodyTextColor,
          icon: Icons.error,
          titleColor: AppSnackBarColorTheme.of(context).snackBarErrorTextColor,
          bottomPadding: 20,
        ),
      ),
    );
  }

  void _hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}
