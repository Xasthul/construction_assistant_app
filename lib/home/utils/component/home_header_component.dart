import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/home_color_theme.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeHeaderComponent extends StatelessWidget {
  const HomeHeaderComponent({super.key});

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(
            // TODO(naz): implement _store.userName
            AppLocalizations.of(context).homeHello('Nazar'),
            style: AppTextTheme.of(context).headline2Regular.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 40,
          width: 40,
          child: FilledButton(
            onPressed: HomeNavigator.of(context).navigateToProfile,
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                const CircleBorder(),
              ),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              backgroundColor: WidgetStateProperty.all(
                HomeColorTheme.of(context).profileButtonBackgroundColor,
              ),
              foregroundColor: WidgetStateProperty.all(
                HomeColorTheme.of(context).profileButtonForegroundColor,
              ),
              overlayColor: WidgetStateProperty.all<Color>(
                HomeColorTheme.of(context).profileButtonPressedColor,
              ),
            ),
            child: Text(
              // TODO(naz): implement _store.firstNameLetter,
              'N',
              style: AppTextTheme.of(context).headline1Regular,
            ),
          ),
        ),
      ]);
}
