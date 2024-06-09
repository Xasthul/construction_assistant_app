import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/app/utils/component/scrollable_content_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/login_dependencies.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:construction_assistant_app/login/utils/component/login_continue_button_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_description_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_email_text_field_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_password_text_field_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_register_component.dart';
import 'package:construction_assistant_app/login/utils/navigator/login_navigator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context) => LoginDependencies(
        child: LoginNavigator(
          child: const _LoginComponentBase(),
        ),
      );
}

class _LoginComponentBase extends StatefulWidget {
  const _LoginComponentBase();

  @override
  State<_LoginComponentBase> createState() => _LoginComponentBaseState();
}

class _LoginComponentBaseState extends State<_LoginComponentBase> with ReactionDispose, AfterLayout {
  final LoginStore _store = getIt<LoginStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.errorMessage, (String? errorMessage) {
          if (errorMessage != null) {
            ScaffoldMessenger.of(context).showAppErrorSnackBar(
              context: context,
              title: errorMessage,
              shouldHideKeyboard: true,
            );
            _store.resetErrorMessage();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => HideKeyboardComponent(
        child: Scaffold(
          body: SafeArea(
            child: ScrollableContentComponent(
              appBarTitle: AppLocalizations.of(context).loginTitle,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  SizedBox(height: 20),
                  LoginDescriptionComponent(),
                  SizedBox(height: 28),
                  LoginEmailTextFieldComponent(),
                  SizedBox(height: 16),
                  LoginPasswordTextFieldComponent(),
                  SizedBox(height: 48),
                  LoginContinueButtonComponent(),
                  SizedBox(height: 20),
                  LoginRegisterButtonComponent(),
                  SizedBox(height: 32),
                ]),
              ),
            ),
          ),
        ),
      );
}
