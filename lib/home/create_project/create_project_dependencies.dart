import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/create_project/store/create_project_store.dart';
import 'package:flutter/material.dart';

class CreateProjectDependencies extends StatefulWidget {
  const CreateProjectDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<CreateProjectDependencies> createState() => _CreateProjectDependenciesState();
}

class _CreateProjectDependenciesState extends State<CreateProjectDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<CreateProjectStore>(() => CreateProjectStore());
  }
}
