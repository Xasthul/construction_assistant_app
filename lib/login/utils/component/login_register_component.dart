import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/utils/navigator/login_navigator.dart';
import 'package:flutter/material.dart';

class LoginRegisterButtonComponent extends StatelessWidget {
  const LoginRegisterButtonComponent({super.key});

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
          onPressed: LoginNavigator.of(context).navigateToCreateAccountComponent,
        ),
      ]);
}
