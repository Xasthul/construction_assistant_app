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

class StepSettingsUpdateDetailsComponent extends StatefulWidget {
  const StepSettingsUpdateDetailsComponent({super.key});

  @override
  State<StepSettingsUpdateDetailsComponent> createState() => _StepSettingsUpdateDetailsComponentState();
}

class _StepSettingsUpdateDetailsComponentState extends State<StepSettingsUpdateDetailsComponent>
    with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();
  late TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _store.step.details);
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isStepDetailsUpdatedSuccessfully, (bool isStepDetailsUpdatedSuccessfully) {
          if (isStepDetailsUpdatedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsStepDetailsUpdatedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).stepSettingsUpdateStepDetailsTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).stepSettingsStepDetailsLabel,
          textFieldHint: AppLocalizations.of(context).stepSettingsEnterStepDetailsHint,
          textFieldMaxLength: 500,
          textInputAction: TextInputAction.newline,
          onTextFieldChanged: _store.updateNewStepDetails,
          buttonTitle: AppLocalizations.of(context).stepSettingsUpdateButton,
          isButtonEnabled: _store.isUpdateStepDetailsEnabled,
          onButtonPressed: _store.updateStepDetails,
          maxLines: 16,
        ),
      );

  @override
  void dispose() {
    _store.resetNewStepDetails();
    _controller.dispose();
    super.dispose();
  }
}
