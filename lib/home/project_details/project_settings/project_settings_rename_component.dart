import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProjectSettingsRenameComponent extends StatefulWidget {
  const ProjectSettingsRenameComponent({super.key});

  @override
  State<ProjectSettingsRenameComponent> createState() => _ProjectSettingsRenameComponentState();
}

class _ProjectSettingsRenameComponentState extends State<ProjectSettingsRenameComponent>
    with ReactionDispose, AfterLayout {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _store.project.title);
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isProjectRenamedSuccessfully, (bool isProjectRenamedSuccessfully) {
          if (isProjectRenamedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsProjectRenamedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).projectSettingsRenameTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(height: 40),
              AppTextFieldComponent(
                title: AppLocalizations.of(context).projectSettingsProjectNameLabel,
                hint: AppLocalizations.of(context).projectSettingsEnterProjectNameHint,
                controller: _controller,
                maxLength: 30,
                textInputAction: TextInputAction.done,
                onChanged: _store.updateNewProjectName,
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (context) => AppFilledButtonComponent(
                  title: AppLocalizations.of(context).projectSettingsUpdateButton,
                  onPressed: _store.isUpdateProjectNameButtonEnabled ? _store.updateProjectName : null,
                ),
              ),
              const SizedBox(height: 16),
            ]),
          ),
        ),
      );

  @override
  void dispose() {
    _store.resetNewProjectName();
    _controller.dispose();
    super.dispose();
  }
}
