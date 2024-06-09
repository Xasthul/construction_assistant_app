import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/service/project_details_service.dart';
import 'package:construction_assistant_app/home/project_details/utils/use_case/project_details_use_case.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:flutter/material.dart';

class ProjectDetailsDependencies extends StatefulWidget {
  const ProjectDetailsDependencies({
    super.key,
    required Project project,
    required Widget child,
  })  : _project = project,
        _child = child;

  final Project _project;
  final Widget _child;

  @override
  State<ProjectDetailsDependencies> createState() => _ProjectDetailsDependenciesState();
}

class _ProjectDetailsDependenciesState extends State<ProjectDetailsDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<ProjectDetailsService>(() => ProjectDetailsService());
    getIt.registerLazySingleton<ProjectDetailsUseCase>(() => ProjectDetailsUseCase());
    getIt.registerLazySingleton<ProjectDetailsStore>(() => ProjectDetailsStore(project: widget._project)..load());
  }
}
