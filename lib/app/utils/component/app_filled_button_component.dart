import 'package:construction_assistant_app/app/utils/component/app_circular_progress_indicator_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_filled_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppFilledButtonComponent extends StatelessWidget {
  const AppFilledButtonComponent({
    super.key,
    required String title,
    required VoidCallback? onPressed,
    bool isLoading = false,
    String? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? pressedColor,
    Color? loadingColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    TextStyle? textStyle,
    Size? size,
    double? elevation,
  })  : _title = title,
        _onPressed = onPressed,
        _isLoading = isLoading,
        _icon = icon,
        _backgroundColor = backgroundColor,
        _foregroundColor = foregroundColor,
        _pressedColor = pressedColor,
        _loadingColor = loadingColor,
        _disabledBackgroundColor = disabledBackgroundColor,
        _disabledForegroundColor = disabledForegroundColor,
        _textStyle = textStyle,
        _size = size,
        _elevation = elevation;

  final String _title;
  final VoidCallback? _onPressed;
  final bool _isLoading;
  final String? _icon;
  final Color? _backgroundColor;
  final Color? _foregroundColor;
  final Color? _pressedColor;
  final Color? _loadingColor;
  final Color? _disabledBackgroundColor;
  final Color? _disabledForegroundColor;
  final TextStyle? _textStyle;
  final Size? _size;
  final double? _elevation;

  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(
          child: FilledButton(
            onPressed: _isLoading //
                ? () {}
                : _onPressed,
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.disabled)) {
                  return _disabledForegroundColor ??
                      AppFilledButtonColorTheme.of(context).filledButtonDisabledForegroundColor;
                }
                return _foregroundColor ?? AppFilledButtonColorTheme.of(context).filledButtonDefaultForegroundColor;
              }),
              backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.disabled)) {
                  return _disabledBackgroundColor ?? AppFilledButtonColorTheme.of(context).filledButtonDisabledColor;
                }
                if (_isLoading) {
                  return _loadingColor ?? AppFilledButtonColorTheme.of(context).filledButtonLoadingColor;
                }
                return _backgroundColor ?? AppFilledButtonColorTheme.of(context).filledButtonDefaultColor;
              }),
              overlayColor: WidgetStateProperty.all<Color>(
                _pressedColor ?? AppFilledButtonColorTheme.of(context).filledButtonPressedColor,
              ),
              minimumSize: WidgetStateProperty.all<Size?>(_size),
              elevation: WidgetStateProperty.all(_elevation),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (_isLoading) ...[
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: AppCircularProgressIndicatorComponent(
                      color: _foregroundColor ?? //
                          AppFilledButtonColorTheme.of(context).filledButtonDefaultForegroundColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                if (!_isLoading && _icon != null) ...[
                  Image.asset(
                    _icon,
                    height: 24,
                    width: 24,
                    color: _getIconColor(context),
                  ),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    _title,
                    style: _textStyle ?? AppTextTheme.of(context).buttonRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]),
            ),
          ),
        ),
      ]);

  Color? _getIconColor(BuildContext context) {
    if (_onPressed == null) {
      return _disabledForegroundColor ?? AppFilledButtonColorTheme.of(context).filledButtonDisabledForegroundColor;
    }
    if (_foregroundColor != null) {
      return _foregroundColor;
    }
    return AppFilledButtonColorTheme.of(context).filledButtonDefaultForegroundColor;
  }
}
