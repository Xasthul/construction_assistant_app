import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class AppCircularProgressIndicatorComponent extends StatelessWidget {
  const AppCircularProgressIndicatorComponent({
    super.key,
    Color? color,
  }) : _color = color;

  final Color? _color;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: _color ?? CommonColorTheme.of(context).circularProgressIndicatorColor,
            strokeWidth: 3,
          ),
        ),
      );
}
