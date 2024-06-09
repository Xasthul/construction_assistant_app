import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/project_details_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/component/header_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectSettingsUsersContentComponent extends StatefulWidget {
  const ProjectSettingsUsersContentComponent({super.key});

  @override
  State<ProjectSettingsUsersContentComponent> createState() => _ProjectSettingsUsersContentComponentState();
}

class _ProjectSettingsUsersContentComponentState extends State<ProjectSettingsUsersContentComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Expanded(
          child: Column(children: [
            const SizedBox(height: 20),
            HeaderComponent(
              title: AppLocalizations.of(context).projectSettingsUsersCount(_store.usersCount),
              buttonTitle: AppLocalizations.of(context).projectSettingsAddNewUserButton,
              onPressed: HomeNavigator.of(context).navigateToProjectSettingsAddUser,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: _store.usersCount,
                itemBuilder: (context, index) => AppActionButtonComponent(
                  title: _store.project.users[index].email,
                  trailing: IconButton(
                    onPressed: () => _store.deleteUser(userEmail: _store.project.users[index].email),
                    icon: Icon(
                      Icons.delete_rounded,
                      color: ProjectDetailsColorTheme.of(context).projectSettingsDeleteUserIconColor,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            )
          ]),
        ),
      );
}
