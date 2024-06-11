import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/no_overscroll_behavior.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_details_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_assets_button_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_details_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_footer_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_name_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_order_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_settings_button_component.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:mobx/mobx.dart';

class StepDetailsComponent extends StatelessWidget {
  const StepDetailsComponent({
    super.key,
    required Project project,
    required Step step,
  })  : _project = project,
        _step = step;

  final Project _project;
  final Step _step;

  @override
  Widget build(BuildContext context) => StepDetailsDependencies(
        project: _project,
        step: _step,
        child: const _StepDetailsComponentBase(),
      );
}

class _StepDetailsComponentBase extends StatefulWidget {
  const _StepDetailsComponentBase();

  @override
  State<_StepDetailsComponentBase> createState() => _StepDetailsComponentBaseState();
}

class _StepDetailsComponentBaseState extends State<_StepDetailsComponentBase> with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

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
          title: AppLocalizations.of(context).stepDetailsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
          actions: const [StepSettingsButtonComponent()],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(scrollBehavior: NoOverScrollBehavior(), slivers: const [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 20),
                  StepDetailsNameComponent(),
                  SizedBox(height: 16),
                  StepDetailsOrderComponent(),
                  SizedBox(height: 16),
                  StepDetailsDetailsComponent(),
                  SizedBox(height: 16),
                  StepDetailsAssetsButtonComponent(),
                  Spacer(),
                  SizedBox(height: 32),
                  StepDetailsFooterComponent(),
                  SizedBox(height: 24),
                ]),
              ),
            ]),
          ),
        ),
      );
}
