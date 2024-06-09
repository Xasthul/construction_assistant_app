import 'package:construction_assistant_app/home/utils/component/empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeEmptyContentComponent extends StatelessWidget {
  const HomeEmptyContentComponent({super.key});

  @override
  Widget build(BuildContext context) => EmptyContentComponent(
        title: AppLocalizations.of(context).homeNoProjectsTitle,
        description: AppLocalizations.of(context).homeInOrderToStartLabel,
        buttonTitle: AppLocalizations.of(context).homeCreateProjectButton,
        onPressed: HomeNavigator.of(context).navigateToCreateProject,
      );
}
