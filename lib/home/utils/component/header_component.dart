import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({
    super.key,
    required String title,
    required String buttonTitle,
    required VoidCallback onPressed,
  })  : _title = title,
        _buttonTitle = buttonTitle,
        _onPressed = onPressed;

  final String _title;
  final String _buttonTitle;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          _title,
          style: AppTextTheme.of(context).body2Bold.copyWith(
                color: CommonColorTheme.of(context).titleTextColor,
              ),
        ),
        const SizedBox(width: 8),
        AppTextButtonComponent(
          title: _buttonTitle,
          onPressed: _onPressed,
        ),
      ]);
}
