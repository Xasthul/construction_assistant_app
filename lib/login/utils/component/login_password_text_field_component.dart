import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/entity/app_assets.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPasswordTextFieldComponent extends StatefulWidget {
  const LoginPasswordTextFieldComponent({super.key});

  @override
  State<LoginPasswordTextFieldComponent> createState() => _LoginPasswordTextFieldComponentState();
}

class _LoginPasswordTextFieldComponentState extends State<LoginPasswordTextFieldComponent> {
  final LoginStore _store = getIt<LoginStore>();
  late TextEditingController _passwordController;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppTextFieldComponent(
          controller: _passwordController,
          title: AppLocalizations.of(context).loginPasswordLabel,
          maxLength: 30,
          obscureText: _store.obscurePasswordField,
          textInputAction: TextInputAction.done,
          hint: AppLocalizations.of(context).loginEnterYourPasswordHint,
          focusNode: _passwordFocusNode,
          onChanged: (text) => _store.updateLoginState(password: text),
          trailingIcon: _store.obscurePasswordField //
              ? AppAssets.iconVisibility
              : AppAssets.iconVisibilityCrossed,
          onTrailingIconPressed: () => _store.toggleObscurePasswordField(
            controllerText: _passwordController.text,
          ),
          isEmpty: _store.isPasswordEmpty,
        ),
      );

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
