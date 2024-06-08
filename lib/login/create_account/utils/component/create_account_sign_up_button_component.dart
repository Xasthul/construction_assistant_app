import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountSignUpButtonComponent extends StatefulWidget {
  const CreateAccountSignUpButtonComponent({super.key});

  @override
  State<CreateAccountSignUpButtonComponent> createState() => _CreateAccountSignUpButtonComponentState();
}

class _CreateAccountSignUpButtonComponentState extends State<CreateAccountSignUpButtonComponent> {
  final CreateAccountStore _store = getIt<CreateAccountStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppFilledButtonComponent(
          onPressed: _store.shouldEnableSignUpButton //
              ? _store.signUpButtonClicked
              : null,
          title: AppLocalizations.of(context).createAccountSignUpButton,
          isLoading: _store.isLoading,
        ),
      );
}
