import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/app/utils/component/scrollable_content_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/create_account_dependencies.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_confirm_password_text_field_component.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_email_text_field_component.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_login_button_component.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_name_text_field_component.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_password_text_field_component.dart';
import 'package:construction_assistant_app/login/create_account/utils/component/create_account_sign_up_button_component.dart';
import 'package:construction_assistant_app/login/utils/navigator/login_navigator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class CreateAccountComponent extends StatelessWidget {
  const CreateAccountComponent({super.key});

  @override
  Widget build(BuildContext context) => const CreateAccountDependencies(
        child: _CreateAccountComponentBase(),
      );
}

class _CreateAccountComponentBase extends StatefulWidget {
  const _CreateAccountComponentBase();

  @override
  State<_CreateAccountComponentBase> createState() => _CreateAccountComponentBaseState();
}

class _CreateAccountComponentBaseState extends State<_CreateAccountComponentBase> with ReactionDispose, AfterLayout {
  final CreateAccountStore _store = getIt<CreateAccountStore>();
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void afterLayout(context) => disposers.add(
        reaction(
          (_) => _store.errorMessage,
          (String? errorMessage) {
            if (_store.errorMessage != null) {
              ScaffoldMessenger.of(context).showAppErrorSnackBar(
                context: context,
                title: errorMessage!,
                shouldHideKeyboard: true,
              );
              _store.handleErrorMessage();
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) => HideKeyboardComponent(
        child: Scaffold(
          body: SafeArea(
            child: ScrollableContentComponent(
              staticAppBarTitle: AppLocalizations.of(context).createAccountTitle,
              leading: BackButton(
                onPressed: LoginNavigator.of(context).pop,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 16),
                  const CreateAccountNameTextFieldComponent(),
                  const SizedBox(height: 24),
                  const CreateAccountEmailTextFieldComponent(),
                  const SizedBox(height: 24),
                  CreateAccountPasswordTextFieldComponent(
                    passwordFocusNode: _passwordFocusNode,
                    confirmPasswordFocusNode: _confirmPasswordFocusNode,
                  ),
                  const SizedBox(height: 24),
                  CreateAccountConfirmPasswordTextFieldComponent(
                    confirmPasswordFocusNode: _confirmPasswordFocusNode,
                  ),
                  const SizedBox(height: 44),
                  const CreateAccountSignUpButtonComponent(),
                  const SizedBox(height: 20),
                  const CreateAccountLoginButtonComponent(),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
