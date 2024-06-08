import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountNameTextFieldComponent extends StatefulWidget {
  const CreateAccountNameTextFieldComponent({super.key});

  @override
  State<CreateAccountNameTextFieldComponent> createState() => _CreateAccountNameTextFieldComponentState();
}

class _CreateAccountNameTextFieldComponentState extends State<CreateAccountNameTextFieldComponent> {
  final CreateAccountStore _store = getIt<CreateAccountStore>();
  late TextEditingController _nameController;
  late FocusNode _nameFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController()..addListener(_store.clearNameError);
    _nameFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppTextFieldComponent(
          controller: _nameController,
          title: AppLocalizations.of(context).createAccountNameLabel,
          maxLength: 30,
          textInputAction: TextInputAction.next,
          hint: AppLocalizations.of(context).createAccountEnterYourNameHint,
          errorText: _store.nameError,
          focusNode: _nameFocusNode,
          // nextFocusNode: widget._emailFocusNode,
          onChanged: (nameText) => _store.updateCreateAccountState(name: nameText),
          textCapitalization: TextCapitalization.words,
        ),
      );

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }
}
