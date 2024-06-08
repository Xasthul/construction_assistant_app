import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountEmailTextFieldComponent extends StatefulWidget {
  const CreateAccountEmailTextFieldComponent({super.key});

  @override
  State<CreateAccountEmailTextFieldComponent> createState() => _CreateAccountEmailTextFieldComponentState();
}

class _CreateAccountEmailTextFieldComponentState extends State<CreateAccountEmailTextFieldComponent> {
  final CreateAccountStore _store = getIt<CreateAccountStore>();
  late TextEditingController _emailController;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()..addListener(_store.clearEmailError);
    _emailFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppTextFieldComponent(
          controller: _emailController,
          title: AppLocalizations.of(context).createAccountEmailLabel,
          maxLength: 100,
          textInputAction: TextInputAction.next,
          hint: AppLocalizations.of(context).createAccountEnterYourEmailHint,
          errorText: _store.emailError,
          focusNode: _emailFocusNode,
          onChanged: (emailText) => _store.updateCreateAccountState(email: emailText),
          textInputType: TextInputType.emailAddress,
        ),
      );

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }
}
