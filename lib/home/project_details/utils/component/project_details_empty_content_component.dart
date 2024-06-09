import 'package:construction_assistant_app/home/utils/component/empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ProjectDetailsEmptyContentComponent extends StatelessWidget {
  const ProjectDetailsEmptyContentComponent({super.key});

  @override
  Widget build(BuildContext context) => EmptyContentComponent(
        title: AppLocalizations.of(context).projectDetailsNoStepsLabel,
        description: AppLocalizations.of(context).projectDetailsCreateFirstStepLabel,
        buttonTitle: AppLocalizations.of(context).projectDetailsAddStepButton,
        onPressed: HomeNavigator.of(context).navigateToCreateStep,
      );
}
