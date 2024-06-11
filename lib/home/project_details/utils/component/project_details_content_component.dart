import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_header_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectDetailsContentComponent extends StatefulWidget {
  const ProjectDetailsContentComponent({super.key});

  @override
  State<ProjectDetailsContentComponent> createState() => _ProjectDetailsContentComponentState();
}

class _ProjectDetailsContentComponentState extends State<ProjectDetailsContentComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(children: [
          const SizedBox(height: 20),
          const ProjectDetailsHeaderComponent(),
          const SizedBox(height: 24),
          Observer(
            builder: (context) => Expanded(
              child: ListView.separated(
                itemCount: _store.stepsCount,
                itemBuilder: (context, index) => AppActionButtonComponent(
                  title: AppLocalizations.of(context).projectStepOrderLabel(
                    _store.steps[index].order,
                    _store.steps[index].title,
                  ),
                  onPressed: () => HomeNavigator.of(context).navigateToStepDetails(
                    project: _store.project,
                    step: _store.steps[index],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ]),
      );
}
