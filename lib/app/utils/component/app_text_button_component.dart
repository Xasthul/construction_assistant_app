import 'package:construction_assistant_app/app/utils/theme/app_text_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTextButtonComponent extends StatelessWidget {
  const AppTextButtonComponent({
    super.key,
    required String title,
    required VoidCallback? onPressed,
    Color? titleColor,
    Color? titlePressedColor,
    TextStyle? textStyle,
  })  : _title = title,
        _onPressed = onPressed,
        _titleColor = titleColor,
        _titlePressedColor = titlePressedColor,
        _textStyle = textStyle;

  final String _title;
  final VoidCallback? _onPressed;
  final Color? _titleColor;
  final Color? _titlePressedColor;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            const Size(0, 40),
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return _titlePressedColor ?? AppTextButtonColorTheme.of(context).pressedForegroundColor;
            }
            return _titleColor ?? AppTextButtonColorTheme.of(context).foregroundColor;
          }),
          overlayColor: WidgetStateProperty.all(AppTextButtonColorTheme.of(context).overlayColor),
        ),
        child: Text(
          _title,
          style: _textStyle ?? AppTextTheme.of(context).buttonRegular,
          textAlign: TextAlign.center,
        ),
      );
}
