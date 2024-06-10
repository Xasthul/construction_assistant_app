import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/app/utils/entity/app_assets.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProfileChangePasswordComponent extends StatefulWidget {
  const ProfileChangePasswordComponent({super.key});

  @override
  State<ProfileChangePasswordComponent> createState() => _ProfileChangePasswordComponentState();
}

class _ProfileChangePasswordComponentState extends State<ProfileChangePasswordComponent>
    with ReactionDispose, AfterLayout {
  final ProfileStore _store = getIt<ProfileStore>();
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  late FocusNode _newPasswordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _newPasswordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.isChangePasswordSuccessful, (bool isChangePasswordSuccessful) {
          if (isChangePasswordSuccessful) {
            HomeNavigator.of(context).pop();
            _store.resetIsChangePasswordSuccessful();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => HideKeyboardComponent(
    child: Scaffold(
          appBar: AppBarComponent(
            title: AppLocalizations.of(context).profileChangePasswordTitle,
            onBackButtonPressed: HomeNavigator.of(context).pop,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(
                builder: (context) => SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(height: 40),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).profileOldPasswordLabel,
                      hint: AppLocalizations.of(context).profileEnterYourOldPasswordHint,
                      controller: _oldPasswordController,
                      maxLength: 256,
                      nextFocusNode: _newPasswordFocusNode,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) => _store.updateChangePasswordState(oldPasswordText: text),
                      obscureText: _store.changePasswordState.obscureOldPasswordField,
                      trailingIcon: _store.changePasswordState.obscureOldPasswordField //
                          ? AppAssets.iconVisibility
                          : AppAssets.iconVisibilityCrossed,
                      onTrailingIconPressed: () => _store.toggleObscureOldPasswordField(
                        text: _oldPasswordController.text,
                      ),
                      isEmpty: _store.isOldPasswordEmpty,
                    ),
                    const SizedBox(height: 32),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).profileNewPasswordLabel,
                      hint: AppLocalizations.of(context).profileEnterYourNewPasswordHint,
                      controller: _newPasswordController,
                      maxLength: 256,
                      focusNode: _newPasswordFocusNode,
                      nextFocusNode: _confirmPasswordFocusNode,
                      textInputAction: TextInputAction.next,
                      onChanged: (text) => _store.updateChangePasswordState(newPasswordText: text),
                      obscureText: _store.changePasswordState.obscureNewPasswordField,
                      trailingIcon: _store.changePasswordState.obscureNewPasswordField //
                          ? AppAssets.iconVisibility
                          : AppAssets.iconVisibilityCrossed,
                      onTrailingIconPressed: () => _store.toggleObscureNewPasswordField(
                        text: _newPasswordController.text,
                      ),
                      isEmpty: _store.isNewPasswordEmpty,
                    ),
                    const SizedBox(height: 32),
                    AppTextFieldComponent(
                      title: AppLocalizations.of(context).profileConfirmPasswordLabel,
                      hint: AppLocalizations.of(context).profileConfirmYourNewPasswordHint,
                      controller: _confirmPasswordController,
                      maxLength: 256,
                      textInputAction: TextInputAction.done,
                      onChanged: (text) => _store.updateChangePasswordState(confirmPasswordText: text),
                      obscureText: _store.changePasswordState.obscureConfirmPasswordField,
                      trailingIcon: _store.changePasswordState.obscureConfirmPasswordField //
                          ? AppAssets.iconVisibility
                          : AppAssets.iconVisibilityCrossed,
                      onTrailingIconPressed: () => _store.toggleObscureConfirmPasswordField(
                        text: _confirmPasswordController.text,
                      ),
                      isEmpty: _store.isConfirmPasswordEmpty,
                    ),
                    const SizedBox(height: 32),
                    AppFilledButtonComponent(
                      title: AppLocalizations.of(context).profileSaveButton,
                      onPressed: _store.isSaveChangePasswordButtonEnabled ? _store.updatePassword : null,
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
            ),
          ),
        ),
  );

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
