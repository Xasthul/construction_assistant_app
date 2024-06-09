import 'package:construction_assistant_app/app/utils/theme/app_action_button_color_theme.dart';
import 'package:flutter/material.dart';

class AppActionButtonArrowComponent extends StatelessWidget {
  const AppActionButtonArrowComponent({
    super.key,
    required bool isWarning,
  }) : _isWarning = isWarning;

  final bool _isWarning;

  @override
  Widget build(BuildContext context) => Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: _isWarning
            ? AppActionButtonColorTheme.of(context).warningForegroundColor
            : AppActionButtonColorTheme.of(context).defaultIconColor,
      );
}
