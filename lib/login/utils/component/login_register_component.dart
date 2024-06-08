import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:flutter/material.dart';

class LoginRegisterButtonComponent extends StatefulWidget {
  const LoginRegisterButtonComponent({super.key});

  @override
  State<LoginRegisterButtonComponent> createState() => _LoginRegisterButtonComponentState();
}

class _LoginRegisterButtonComponentState extends State<LoginRegisterButtonComponent> {
  final LoginStore _store = getIt<LoginStore>();

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
          child: Text(
            AppLocalizations.of(context).loginDontHaveAnAccountLabel,
            style: AppTextTheme.of(context).body2Medium.copyWith(
                  color: CommonColorTheme.of(context).labelTextColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        AppTextButtonComponent(
          title: AppLocalizations.of(context).loginRegisterButton,
          onPressed: _store.registerButtonClicked,
        ),
      ]);
}
