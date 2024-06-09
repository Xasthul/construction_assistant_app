import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeAddProjectButtonComponent extends StatelessWidget {
  const HomeAddProjectButtonComponent({super.key});

  @override
  Widget build(BuildContext context) => AppFilledButtonComponent(
        title: AppLocalizations.of(context).homeAddProjectButton,
        onPressed: HomeNavigator.of(context).navigateToCreateProjectComponent,
      );
}
