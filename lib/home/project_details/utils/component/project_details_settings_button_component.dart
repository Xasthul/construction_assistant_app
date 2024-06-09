import 'package:construction_assistant_app/app/utils/theme/project_details_color_theme.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:flutter/material.dart';

class ProjectDetailsSettingsButtonComponent extends StatelessWidget {
  const ProjectDetailsSettingsButtonComponent({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: HomeNavigator.of(context).navigateToProjectSettings,
        icon: Icon(
          Icons.settings,
          color: ProjectDetailsColorTheme.of(context).projectSettingsIconColor,
        ),
      );
}
