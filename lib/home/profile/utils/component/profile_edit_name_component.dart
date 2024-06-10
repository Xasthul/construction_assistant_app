import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/home/utils/component/one_text_field_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProfileEditNameComponent extends StatefulWidget {
  const ProfileEditNameComponent({super.key});

  @override
  State<ProfileEditNameComponent> createState() => _ProfileEditNameComponentState();
}

class _ProfileEditNameComponentState extends State<ProfileEditNameComponent> with ReactionDispose, AfterLayout {
  final ProfileStore _store = getIt<ProfileStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _store.user.name);
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isEditNameSuccessful, (bool isEditNameSuccessful) {
          if (isEditNameSuccessful) {
            HomeNavigator.of(context).pop();
            _store.resetIsEditNameSuccessful();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => OneTextFieldComponent(
          appBarTitle: AppLocalizations.of(context).profileEditNameTitle,
          controller: _controller,
          textFieldLabel: AppLocalizations.of(context).profileNameLabel,
          textFieldHint: AppLocalizations.of(context).profileEnterYourNameHint,
          textFieldMaxLength: 30,
          onTextFieldChanged: _store.updateNewUserName,
          buttonTitle: AppLocalizations.of(context).profileUpdateButton,
          isButtonEnabled: _store.isUpdateNameButtonEnabled,
          onButtonPressed: _store.updateUserName,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
