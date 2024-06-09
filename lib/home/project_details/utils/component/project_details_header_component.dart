import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectDetailsHeaderComponent extends StatefulWidget {
  const ProjectDetailsHeaderComponent({super.key});

  @override
  State<ProjectDetailsHeaderComponent> createState() => _ProjectDetailsHeaderComponentState();
}

class _ProjectDetailsHeaderComponentState extends State<ProjectDetailsHeaderComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Observer(
            builder: (context) => Text(
              AppLocalizations.of(context).projectDetailsStepsCount(_store.stepsCount),
              style: AppTextTheme.of(context).body2Bold.copyWith(
                    color: CommonColorTheme.of(context).titleTextColor,
                  ),
            ),
          ),
          const SizedBox(width: 8),
          AppTextButtonComponent(
            title: AppLocalizations.of(context).projectDetailsAddNewStepButton,
            onPressed: HomeNavigator.of(context).navigateToCreateStep,
          ),
        ]),
      ]);
}
