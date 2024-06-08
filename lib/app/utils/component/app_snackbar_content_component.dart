import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppSnackBarContentComponent extends StatelessWidget {
  const AppSnackBarContentComponent({
    super.key,
    required String title,
    required IconData icon,
    required Color titleColor,
    required double bottomPadding,
    String? body,
    Color? bodyTextColor,
    String? buttonText,
    VoidCallback? onPressed,
  })  : _title = title,
        _icon = icon,
        _titleColor = titleColor,
        _bottomPadding = bottomPadding,
        _body = body,
        _bodyTextColor = bodyTextColor,
        _buttonText = buttonText,
        _onPressed = onPressed;

  final String _title;
  final String? _body;
  final IconData _icon;
  final Color _titleColor;
  final double _bottomPadding;
  final Color? _bodyTextColor;
  final String? _buttonText;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) => Column(children: [
        Row(children: [
          Flexible(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(
                _icon,
                color: _titleColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      _title,
                      style: AppTextTheme.of(context).buttonBold.copyWith(
                            color: _titleColor,
                          ),
                    ),
                    if (_body != null && _bodyTextColor != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        _body,
                        style: AppTextTheme.of(context).buttonRegular.copyWith(
                              color: _bodyTextColor,
                            ),
                      ),
                    ]
                  ]),
                ),
              ),
            ]),
          ),
          if (_buttonText != null && _onPressed != null)
            AppTextButtonComponent(
              title: _buttonText,
              onPressed: _onPressed,
              titleColor: _titleColor,
              textStyle: AppTextTheme.of(context).buttonBold,
            ),
        ]),
        SizedBox(height: _bottomPadding),
      ]);
}
