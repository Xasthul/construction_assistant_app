import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/project_details/create_step/store/create_step_store.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:flutter/material.dart' hide Step;

class CreateStepDependencies extends StatefulWidget {
  const CreateStepDependencies({
    super.key,
    required Project project,
    required Widget child,
  })  : _project = project,
        _child = child;

  final Project _project;
  final Widget _child;

  @override
  State<CreateStepDependencies> createState() => _CreateStepDependenciesState();
}

class _CreateStepDependenciesState extends State<CreateStepDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<CreateStepStore>(() => CreateStepStore(project: widget._project));
  }
}
