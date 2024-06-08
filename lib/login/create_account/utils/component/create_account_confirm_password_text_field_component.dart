import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/entity/app_assets.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAccountConfirmPasswordTextFieldComponent extends StatefulWidget {
  const CreateAccountConfirmPasswordTextFieldComponent({
    super.key,
    required FocusNode confirmPasswordFocusNode,
  }) : _confirmPasswordFocusNode = confirmPasswordFocusNode;

  final FocusNode _confirmPasswordFocusNode;

  @override
  State<CreateAccountConfirmPasswordTextFieldComponent> createState() =>
      _CreateAccountConfirmPasswordTextFieldComponentState();
}

class _CreateAccountConfirmPasswordTextFieldComponentState
    extends State<CreateAccountConfirmPasswordTextFieldComponent> {
  final CreateAccountStore _store = getIt<CreateAccountStore>();
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _confirmPasswordController = TextEditingController()..addListener(_store.clearConfirmPasswordError);
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppTextFieldComponent(
          controller: _confirmPasswordController,
          title: AppLocalizations.of(context).createAccountConfirmPasswordLabel,
          maxLength: 256,
          obscureText: _store.createAccountState.obscureConfirmPasswordField,
          textInputAction: TextInputAction.done,
          hint: AppLocalizations.of(context).createAccountRepeatPasswordHint,
          errorText: _store.confirmPasswordError,
          focusNode: widget._confirmPasswordFocusNode,
          onChanged: (text) => _store.updateCreateAccountState(confirmPassword: text),
          trailingIcon: _store.createAccountState.obscureConfirmPasswordField //
              ? AppAssets.iconVisibility
              : AppAssets.iconVisibilityCrossed,
          onTrailingIconPressed: () => _store.toggleObscureConfirmPasswordField(
            text: _confirmPasswordController.text,
          ),
          isEmpty: _store.isConfirmPasswordEmpty,
        ),
      );

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
