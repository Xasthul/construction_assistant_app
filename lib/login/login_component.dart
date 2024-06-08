import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/app/utils/component/scrollable_content_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/login_dependencies.dart';
import 'package:construction_assistant_app/login/utils/component/login_continue_button_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_description_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_email_text_field_component.dart';
import 'package:construction_assistant_app/login/utils/component/login_password_text_field_component.dart';
import 'package:flutter/material.dart';

class LoginComponent extends StatelessWidget {
  const LoginComponent({super.key});

  @override
  Widget build(BuildContext context) => const LoginDependencies(
        child: _LoginComponentBase(),
      );
}

class _LoginComponentBase extends StatelessWidget {
  const _LoginComponentBase();

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
                ]),
              ),
            ),
          ),
        ),
      );
}
