import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:flutter/material.dart';

class StepSettingsButtonComponent extends StatelessWidget {
  const StepSettingsButtonComponent({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: HomeNavigator.of(context).navigateToStepSettings,
        icon: Icon(
          Icons.settings,
          color: CommonColorTheme.of(context).appBarButtonColor,
        ),
      );
}
