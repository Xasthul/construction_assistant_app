import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/service/step_details_service.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/use_case/step_details_use_case.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:flutter/material.dart' hide Step;

class StepDetailsDependencies extends StatefulWidget {
  const StepDetailsDependencies({
    super.key,
    required Project project,
    required Step step,
    required Widget child,
  })  : _project = project,
        _step = step,
        _child = child;

  final Project _project;
  final Step _step;
  final Widget _child;

  @override
  State<StepDetailsDependencies> createState() => _StepDetailsDependenciesState();
}

class _StepDetailsDependenciesState extends State<StepDetailsDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<StepDetailsService>(() => StepDetailsService());
    getIt.registerLazySingleton<StepDetailsUseCase>(() => StepDetailsUseCase());
    getIt.registerLazySingleton<StepDetailsStore>(() => StepDetailsStore(
          project: widget._project,
          step: widget._step,
        ));
  }
}
