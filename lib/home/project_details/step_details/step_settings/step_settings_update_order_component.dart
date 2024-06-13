import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/formatter/step_order_input_formatter.dart';
import 'package:construction_assistant_app/home/utils/component/one_text_field_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class StepSettingsUpdateOrderComponent extends StatefulWidget {
  const StepSettingsUpdateOrderComponent({super.key});

  @override
  State<StepSettingsUpdateOrderComponent> createState() => _StepSettingsUpdateOrderComponentState();
}

class _StepSettingsUpdateOrderComponentState extends State<StepSettingsUpdateOrderComponent>
    with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _store.stepOrderString);
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isStepOrderUpdatedSuccessfully, (bool isStepOrderUpdatedSuccessfully) {
          if (isStepOrderUpdatedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsStepOrderUpdatedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).stepSettingsUpdateStepOrderTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).stepSettingsOrderLabel,
          textFieldHint: AppLocalizations.of(context).stepSettingsEnterStepOrderHint,
          textFieldMaxLength: 4,
          onTextFieldChanged: _store.updateNewStepOrder,
          buttonTitle: AppLocalizations.of(context).stepSettingsUpdateButton,
          isButtonEnabled: _store.isUpdateStepOrderEnabled,
          onButtonPressed: _store.updateStepOrder,
          textInputType: TextInputType.number,
          inputFormatters: [StepOrderInputFormatter()],
        ),
      );

  @override
  void dispose() {
    _store.resetNewStepOrder();
    super.dispose();
  }
}
