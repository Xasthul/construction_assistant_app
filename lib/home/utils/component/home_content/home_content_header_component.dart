import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeContentHeaderComponent extends StatefulWidget {
  const HomeContentHeaderComponent({super.key});

  @override
  State<HomeContentHeaderComponent> createState() => _HomeContentHeaderComponentState();
}

class _HomeContentHeaderComponentState extends State<HomeContentHeaderComponent> {
  final HomeStore _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Observer(
          builder: (context) => Text(
            AppLocalizations.of(context).homeProjectsCount(_store.projectsCount),
            style: AppTextTheme.of(context).body2Bold.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          ),
        ),
        const SizedBox(width: 8),
        AppTextButtonComponent(
          title: AppLocalizations.of(context).homeCreateNewProjectButton,
          onPressed: HomeNavigator.of(context).navigateToCreateProject,
        ),
      ]);
}
