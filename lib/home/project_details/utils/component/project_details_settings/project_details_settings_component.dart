import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_name_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ProjectDetailsSettingsComponent extends StatefulWidget {
  const ProjectDetailsSettingsComponent({super.key});

  @override
  State<ProjectDetailsSettingsComponent> createState() => _ProjectDetailsSettingsComponentState();
}

class _ProjectDetailsSettingsComponentState extends State<ProjectDetailsSettingsComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).projectSettingsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(height: 20),
              const ProjectDetailsNameComponent(),
              const SizedBox(height: 20),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).projectSettingsRenameButton,
                onPressed: HomeNavigator.of(context).navigateToProjectSettingsRename,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).projectSettingsUsersButton,
                onPressed: HomeNavigator.of(context).navigateToProjectSettingsUsers,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).projectSettingsDeleteButton,
                onPressed: _store.deleteProject,
                isWarning: true,
              ),
              const SizedBox(height: 12),
            ]),
          ),
        ),
      );
}
