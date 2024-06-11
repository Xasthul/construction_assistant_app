import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_name_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class ProjectSettingsComponent extends StatefulWidget {
  const ProjectSettingsComponent({super.key});

  @override
  State<ProjectSettingsComponent> createState() => _ProjectSettingsComponentState();
}

class _ProjectSettingsComponentState extends State<ProjectSettingsComponent> with ReactionDispose, AfterLayout {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isProjectDeletedSuccessfully, (bool isProjectDeletedSuccessfully) {
          if (isProjectDeletedSuccessfully) {
            HomeNavigator.of(context).popUntilFirst();
            _store.resetIsProjectDeletedSuccessfully();
          }
        }),
      );

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
              const SizedBox(height: 32),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).projectSettingsRenameProjectButton,
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
