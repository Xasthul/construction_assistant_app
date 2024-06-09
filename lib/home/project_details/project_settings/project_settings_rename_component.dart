import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/component/one_text_field_component.dart';
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
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).projectSettingsRenameTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).projectSettingsProjectNameLabel,
          textFieldHint: AppLocalizations.of(context).projectSettingsEnterProjectNameHint,
          textFieldMaxLength: 30,
          onTextFieldChanged: _store.updateNewProjectName,
          buttonTitle: AppLocalizations.of(context).projectSettingsUpdateButton,
          isButtonEnabled: _store.isUpdateProjectNameButtonEnabled,
          onButtonPressed: _store.updateProjectName,
        ),
      );

  @override
  void dispose() {
    _store.resetNewProjectName();
    super.dispose();
  }
}
