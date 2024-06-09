import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/theme/project_details_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/project_details_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_header_component.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ProjectDetailsComponent extends StatelessWidget {
  const ProjectDetailsComponent({
    super.key,
    required Project project,
  }) : _project = project;

  final Project _project;

  @override
  Widget build(BuildContext context) => ProjectDetailsDependencies(
        project: _project,
        child: const _ProjectDetailsComponentBase(),
      );
}

class _ProjectDetailsComponentBase extends StatelessWidget {
  const _ProjectDetailsComponentBase();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).projectDetailsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: ProjectDetailsColorTheme.of(context).projectSettingsIconColor,
              ),
            )
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SizedBox(height: 20),
              ProjectDetailsHeaderComponent(),
            ]),
          ),
        ),
      );
}
