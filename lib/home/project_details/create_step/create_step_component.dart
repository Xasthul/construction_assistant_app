import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/create_step/create_step_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/create_step/store/create_step_store.dart';
import 'package:construction_assistant_app/home/project_details/create_step/utils/formatter/create_step_order_input_formatter.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CreateStepComponent extends StatelessWidget {
  const CreateStepComponent({
    super.key,
    required Project project,
  }) : _project = project;

  final Project _project;

  @override
  Widget build(BuildContext context) => CreateStepDependencies(
        project: _project,
        child: const _CreateStepComponentBase(),
      );
}

class _CreateStepComponentBase extends StatefulWidget {
  const _CreateStepComponentBase();

  @override
  State<_CreateStepComponentBase> createState() => _CreateStepComponentBaseState();
}

class _CreateStepComponentBaseState extends State<_CreateStepComponentBase> with ReactionDispose, AfterLayout {
  final CreateStepStore _store = getIt<CreateStepStore>();
  late TextEditingController _nameController;
  late TextEditingController _detailsController;
  late TextEditingController _orderController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _detailsController = TextEditingController();
    _orderController = TextEditingController();
  }

  @override
  void afterLayout(BuildContext context) => disposers.addAll([
        reaction((_) => _store.errorMessage, (String? errorMessage) {
          if (errorMessage != null) {
            ScaffoldMessenger.of(context).showAppErrorSnackBar(
              context: context,
              title: errorMessage,
            );
            _store.resetErrorMessage();
          }
        }),
        reaction((_) => _store.isStepCreatedSuccessfully, (bool isStepCreatedSuccessfully) {
          if (isStepCreatedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsStepCreatedSuccessfully();
          }
        }),
      ]);

  @override
  Widget build(BuildContext context) => HideKeyboardComponent(
        child: Scaffold(
          appBar: AppBarComponent(
            title: AppLocalizations.of(context).createStepTitle,
            onBackButtonPressed: HomeNavigator.of(context).pop,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(
                builder: (context) => SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 40),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).createStepNameLabel,
                      hint: AppLocalizations.of(context).createStepEnterStepNameHint,
                      controller: _nameController,
                      maxLength: 30,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) => _store.updateCreateStepState(nameText: text),
                    ),
                    const SizedBox(height: 24),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).createStepDetailsLabel,
                      hint: AppLocalizations.of(context).createStepEnterStepDetailsHint,
                      controller: _detailsController,
                      maxLength: 500,
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.multiline,
                      onChanged: (text) => _store.updateCreateStepState(detailsText: text),
                    ),
                    const SizedBox(height: 24),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).createStepOrderLabel,
                      hint: AppLocalizations.of(context).createStepEnterStepOrderHint,
                      controller: _orderController,
                      maxLength: 4,
                      textInputAction: TextInputAction.done,
                      onChanged: (text) => _store.updateCreateStepState(orderText: text),
                      inputFormatters: [CreateStepOrderInputFormatter()],
                    ),
                    const SizedBox(height: 24),
                    AppActionButtonComponent(
                      title: AppLocalizations.of(context).createStepAssetsButton,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 36),
                    AppFilledButtonComponent(
                      title: AppLocalizations.of(context).createStepCreateButton,
                      onPressed: _store.isCreateButtonEnabled ? _store.createStep : null,
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _nameController.dispose();
    _detailsController.dispose();
    _orderController.dispose();
    super.dispose();
  }
}
