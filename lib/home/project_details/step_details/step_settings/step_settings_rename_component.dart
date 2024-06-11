import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/utils/component/one_text_field_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class StepSettingsRenameComponent extends StatefulWidget {
  const StepSettingsRenameComponent({super.key});

  @override
  State<StepSettingsRenameComponent> createState() => _StepSettingsRenameComponentState();
}

class _StepSettingsRenameComponentState extends State<StepSettingsRenameComponent> with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _store.step.title);
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isStepRenamedSuccessfully, (bool isStepRenamedSuccessfully) {
          if (isStepRenamedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsStepRenamedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).stepSettingsRenameStepTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).stepSettingsStepNameLabel,
          textFieldHint: AppLocalizations.of(context).stepSettingsEnterStepNameHint,
          textFieldMaxLength: 30,
          onTextFieldChanged: _store.updateNewStepName,
          buttonTitle: AppLocalizations.of(context).stepSettingsUpdateButton,
          isButtonEnabled: _store.isUpdateStepNameEnabled,
          onButtonPressed: _store.renameStep,
        ),
      );

  @override
  void dispose() {
    _store.resetNewStepName();
    super.dispose();
  }
}
