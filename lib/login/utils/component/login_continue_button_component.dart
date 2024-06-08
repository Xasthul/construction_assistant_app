import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginContinueButtonComponent extends StatefulWidget {
  const LoginContinueButtonComponent({super.key});

  @override
  State<LoginContinueButtonComponent> createState() => _LoginContinueButtonComponentState();
}

class _LoginContinueButtonComponentState extends State<LoginContinueButtonComponent> {
  final LoginStore _store = getIt<LoginStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppFilledButtonComponent(
          onPressed: _store.shouldEnableContinueButton //
              ? _store.continueButtonClicked
              : null,
          title: AppLocalizations.of(context).loginContinueButton,
          isLoading: _store.isLoading,
        ),
      );
}
