import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:flutter/material.dart';

class LoginEmailTextFieldComponent extends StatefulWidget {
  const LoginEmailTextFieldComponent({super.key});

  @override
  State<LoginEmailTextFieldComponent> createState() => _LoginEmailTextFieldComponentState();
}

class _LoginEmailTextFieldComponentState extends State<LoginEmailTextFieldComponent> {
  final LoginStore _store = getIt<LoginStore>();
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => AppTextFieldComponent(
        controller: _emailController,
        title: AppLocalizations.of(context).loginEmailLabel,
        maxLength: 300,
        textInputAction: TextInputAction.next,
        hint: AppLocalizations.of(context).loginEnterYourEmailHint,
        onChanged: (emailText) => _store.updateLoginState(email: emailText),
        textInputType: TextInputType.emailAddress,
      );

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
