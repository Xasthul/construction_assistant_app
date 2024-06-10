import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/mapper/home_mapper.dart';
import 'package:construction_assistant_app/home/utils/mapper/users_mapper.dart';
import 'package:construction_assistant_app/home/utils/service/home_service.dart';
import 'package:construction_assistant_app/home/utils/service/users_service.dart';
import 'package:construction_assistant_app/home/utils/use_case/home_use_case.dart';
import 'package:flutter/material.dart';

class HomeDependencies extends StatefulWidget {
  const HomeDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<HomeDependencies> createState() => _HomeDependenciesState();
}

class _HomeDependenciesState extends State<HomeDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<UsersService>(() => UsersService());
    getIt.registerLazySingleton<HomeService>(() => HomeService());
    getIt.registerLazySingleton<UsersMapper>(() => UsersMapper());
    getIt.registerLazySingleton<HomeMapper>(() => HomeMapper());
    getIt.registerLazySingleton<HomeUseCase>(() => HomeUseCase());
    getIt.registerLazySingleton<HomeStore>(() => HomeStore()..load());
  }
}
