import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/utils/component/home_add_project_button_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeEmptyContentComponent extends StatelessWidget {
  const HomeEmptyContentComponent({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(children: [
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                AppLocalizations.of(context).homeNoProjectsTitle,
                style: AppTextTheme.of(context).largeTitleBold.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context).homeInOrderToStartLabel,
                style: AppTextTheme.of(context).body2Medium.copyWith(
                      color: CommonColorTheme.of(context).labelTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          const SizedBox(height: 8),
          const HomeAddProjectButtonComponent(),
          const SizedBox(height: 16),
        ]),
  );
}