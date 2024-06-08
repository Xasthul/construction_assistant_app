import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/entity/app_assets.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountPasswordTextFieldComponent extends StatefulWidget {
  const CreateAccountPasswordTextFieldComponent({
    super.key,
    required FocusNode passwordFocusNode,
    required FocusNode confirmPasswordFocusNode,
  })  : _passwordFocusNode = passwordFocusNode,
        _confirmPasswordFocusNode = confirmPasswordFocusNode;

  final FocusNode _passwordFocusNode;
  final FocusNode _confirmPasswordFocusNode;

  @override
  State<CreateAccountPasswordTextFieldComponent> createState() => _CreateAccountPasswordTextFieldComponentState();
}

class _CreateAccountPasswordTextFieldComponentState extends State<CreateAccountPasswordTextFieldComponent> {
  final CreateAccountStore _store = getIt<CreateAccountStore>();
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController()..addListener(_store.clearPasswordError);
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppTextFieldComponent(
          controller: _passwordController,
          title: AppLocalizations.of(context).createAccountPasswordLabel,
          maxLength: 256,
          obscureText: _store.createAccountState.obscurePasswordField,
          textInputAction: TextInputAction.next,
          hint: AppLocalizations.of(context).createAccountEnterYourPasswordHint,
          helperText: AppLocalizations.of(context).createAccountMinimumCharactersLongHelper,
          errorText: _store.passwordError,
          focusNode: widget._passwordFocusNode,
          nextFocusNode: widget._confirmPasswordFocusNode,
          onChanged: (text) => _store.updateCreateAccountState(password: text),
          trailingIcon: _store.createAccountState.obscurePasswordField //
              ? AppAssets.iconVisibility
              : AppAssets.iconVisibilityCrossed,
          onTrailingIconPressed: () => _store.toggleObscurePasswordField(
            text: _passwordController.text,
          ),
          isEmpty: _store.isPasswordEmpty,
        ),
      );

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
