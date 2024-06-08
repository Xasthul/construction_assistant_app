import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class LoginDescriptionComponent extends StatelessWidget {
  const LoginDescriptionComponent({super.key});

  @override
  Widget build(BuildContext context) => Text(
        AppLocalizations.of(context).loginDescription,
        style: AppTextTheme.of(context).body2Medium.copyWith(
              color: CommonColorTheme.of(context).labelTextColor,
            ),
      );
}
