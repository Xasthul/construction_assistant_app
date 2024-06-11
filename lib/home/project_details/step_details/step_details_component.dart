import 'package:construction_assistant_app/home/project_details/step_details/step_details_dependencies.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:flutter/material.dart' hide Step;

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

class _StepDetailsComponentBase extends StatelessWidget {
  const _StepDetailsComponentBase();

  @override
  Widget build(BuildContext context) => const Placeholder();
}
