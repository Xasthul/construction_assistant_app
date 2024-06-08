import 'package:construction_assistant_app/app/utils/theme/app_text_field_color_theme.dart';
import 'package:flutter/material.dart';

class AppTextFieldIconComponent extends StatelessWidget {
  const AppTextFieldIconComponent({
    super.key,
    required String icon,
    required bool hasError,
    required bool isEmpty,
    required VoidCallback? onPressed,
  })  : _icon = icon,
        _hasError = hasError,
        _isEmpty = isEmpty,
        _onPressed = onPressed;

  final String _icon;
  final bool _hasError;
  final bool _isEmpty;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Image.asset(
          _icon,
          height: 24,
          width: 24,
          color: _hasError
              ? AppTextFieldColorTheme.of(context).errorIconColor
              : _isEmpty
                  ? AppTextFieldColorTheme.of(context).defaultIconColor
                  : AppTextFieldColorTheme.of(context).filledIconColor,
        ),
        onPressed: _onPressed,
      );
}
