import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_circular_progress_indicator_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/project_details_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_content_component.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_empty_content_component.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_name_component.dart';
import 'package:construction_assistant_app/home/project_details/utils/component/project_details_settings_button_component.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProjectDetailsComponent extends StatelessWidget {
  const ProjectDetailsComponent({
    super.key,
    required Project project,
  }) : _project = project;

  final Project _project;

  @override
  Widget build(BuildContext context) => ProjectDetailsDependencies(
        project: _project,
        child: const _ProjectDetailsComponentBase(),
      );
}

class _ProjectDetailsComponentBase extends StatefulWidget {
  const _ProjectDetailsComponentBase();

  @override
  State<_ProjectDetailsComponentBase> createState() => _ProjectDetailsComponentBaseState();
}

class _ProjectDetailsComponentBaseState extends State<_ProjectDetailsComponentBase> with ReactionDispose, AfterLayout {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.errorMessage, (String? errorMessage) {
          if (errorMessage != null) {
            ScaffoldMessenger.of(context).showAppErrorSnackBar(
              context: context,
              title: errorMessage,
            );
            _store.resetErrorMessage();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).projectDetailsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
          actions: const [ProjectDetailsSettingsButtonComponent()],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (context) {
                if (_store.isLoading) {
                  return const Center(
                    child: AppCircularProgressIndicatorComponent(),
                  );
                }
                return Column(children: [
                  const SizedBox(height: 20),
                  const ProjectDetailsNameComponent(),
                  if (_store.steps.isEmpty)
                    const ProjectDetailsContentComponent()
                  else
                    const ProjectDetailsEmptyContentComponent(),
                ]);
              },
            ),
          ),
        ),
      );
}
