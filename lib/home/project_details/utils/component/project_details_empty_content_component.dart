import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/utils/component/empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectDetailsEmptyContentComponent extends StatefulWidget {
  const ProjectDetailsEmptyContentComponent({super.key});

  @override
  State<ProjectDetailsEmptyContentComponent> createState() => _ProjectDetailsEmptyContentComponentState();
}

class _ProjectDetailsEmptyContentComponentState extends State<ProjectDetailsEmptyContentComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(builder: (context) {
        if (_store.isProjectOwner) {
          return EmptyContentComponent(
            title: AppLocalizations.of(context).projectDetailsNoStepsLabel,
            description: AppLocalizations.of(context).projectDetailsCreateFirstStepLabel,
            buttonTitle: AppLocalizations.of(context).projectDetailsAddStepButton,
            onPressed: () => HomeNavigator.of(context).navigateToCreateStep(project: _store.project),
          );
        }
        return Text(
          AppLocalizations.of(context).projectDetailsNoStepsLabel,
          style: AppTextTheme.of(context).largeTitleBold.copyWith(
                color: CommonColorTheme.of(context).titleTextColor,
              ),
          textAlign: TextAlign.center,
        );
      });
}
