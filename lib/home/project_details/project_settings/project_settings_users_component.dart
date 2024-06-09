import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_users_content_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_users_empty_content_component.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectSettingsUsersComponent extends StatefulWidget {
  const ProjectSettingsUsersComponent({super.key});

  @override
  State<ProjectSettingsUsersComponent> createState() => _ProjectSettingsUsersComponentState();
}

class _ProjectSettingsUsersComponentState extends State<ProjectSettingsUsersComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).projectSettingsProjectUsersTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (context) {
                if (_store.project.users.isNotEmpty) {
                  return const ProjectSettingsUsersContentComponent();
                }
                return const ProjectSettingsUsersEmptyContentComponent();
              },
            ),
          ),
        ),
      );
}
