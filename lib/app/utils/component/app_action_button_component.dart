import 'package:construction_assistant_app/app/utils/theme/app_action_button_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class AppActionButtonComponent extends StatelessWidget {
  const AppActionButtonComponent({
    super.key,
    required String title,
    required VoidCallback onPressed,
  })  : _title = title,
        _onPressed = onPressed;

  final String _title;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            AppActionButtonColorTheme.of(context).defaultBackgroundColor,
          ),
          textStyle: WidgetStateProperty.all(
            AppTextTheme.of(context).body2Medium,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12),
          ),
          fixedSize: WidgetStateProperty.all(
            const Size.fromHeight(52),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          overlayColor: WidgetStateProperty.all(
            AppActionButtonColorTheme.of(context).defaultPressedColor,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Text(
              _title,
              style: TextStyle(
                color: CommonColorTheme.of(context).titleTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppActionButtonColorTheme.of(context).defaultIconColor,
            ),
          ),
        ]),
      );
}
