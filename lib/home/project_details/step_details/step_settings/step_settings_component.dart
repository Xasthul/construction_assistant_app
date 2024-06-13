import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_name_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class StepSettingsComponent extends StatefulWidget {
  const StepSettingsComponent({super.key});

  @override
  State<StepSettingsComponent> createState() => _StepSettingsComponentState();
}

class _StepSettingsComponentState extends State<StepSettingsComponent> with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isStepDeletedSuccessfully, (bool isStepDeletedSuccessfully) {
          if (isStepDeletedSuccessfully) {
            HomeNavigator.of(context).popUntil(HomeNavigator.projectDetailsRouteName);
            _store.resetIsStepDeletedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).stepSettingsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(height: 20),
              const StepDetailsNameComponent(),
              const SizedBox(height: 32),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).stepSettingsRenameStepButton,
                onPressed: HomeNavigator.of(context).navigateToStepSettingsRename,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).stepSettingsUpdateDetailsButton,
                onPressed: HomeNavigator.of(context).navigateToStepSettingsUpdateDetails,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).stepSettingsUpdateAssetsButton,
                onPressed: HomeNavigator.of(context).navigateToStepSettingsAssets,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).stepSettingsDeleteStepButton,
                onPressed: _store.deleteStep,
                isWarning: true,
              ),
              const SizedBox(height: 12),
            ]),
          ),
        ),
      );
}
