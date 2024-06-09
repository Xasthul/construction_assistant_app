import 'package:construction_assistant_app/home/utils/component/empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ProjectSettingsUsersEmptyContentComponent extends StatelessWidget {
  const ProjectSettingsUsersEmptyContentComponent({super.key});

  @override
  Widget build(BuildContext context) => EmptyContentComponent(
        title: AppLocalizations.of(context).projectSettingsYouAreTheOnlyUserLabel,
        description: AppLocalizations.of(context).projectSettingsAddMoreUsersLabel,
        buttonTitle: AppLocalizations.of(context).projectSettingsAddUserButton,
        onPressed: HomeNavigator.of(context).navigateToProjectSettingsAddUser,
      );
}
