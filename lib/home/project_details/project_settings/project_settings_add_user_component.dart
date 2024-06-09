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

class ProjectSettingsAddUserComponent extends StatefulWidget {
  const ProjectSettingsAddUserComponent({super.key});

  @override
  State<ProjectSettingsAddUserComponent> createState() => _ProjectSettingsAddUserComponentState();
}

class _ProjectSettingsAddUserComponentState extends State<ProjectSettingsAddUserComponent>
    with ReactionDispose, AfterLayout {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isAddUserSuccessful, (bool isAddUserSuccessful) {
          if (isAddUserSuccessful) {
            HomeNavigator.of(context).pop();
            _store.resetIsAddUserSuccessful();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).projectSettingsAddUserTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).projectSettingsUserEmailLabel,
          textFieldHint: AppLocalizations.of(context).projectSettingsEnterUsersEmailHint,
          textFieldMaxLength: 300,
          onTextFieldChanged: _store.updateAddUserEmail,
          buttonTitle: AppLocalizations.of(context).projectSettingsAddButton,
          isButtonEnabled: _store.isAddUserButtonEnabled,
          onButtonPressed: _store.addUser,
        ),
      );

  @override
  void dispose() {
    _store.resetAddUserEmail();
    _controller.dispose();
    super.dispose();
  }
}
