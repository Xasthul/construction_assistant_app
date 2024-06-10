import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/home/profile/utils/use_case/profile_use_case.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:flutter/material.dart';

class ProfileDependencies extends StatefulWidget {
  const ProfileDependencies({
    super.key,
    required User user,
    required Widget child,
  })  : _user = user,
        _child = child;

  final User _user;
  final Widget _child;

  @override
  State<ProfileDependencies> createState() => _ProfileDependenciesState();
}

class _ProfileDependenciesState extends State<ProfileDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<ProfileUseCase>(() => ProfileUseCase());
    getIt.registerLazySingleton<ProfileStore>(() => ProfileStore(user: widget._user));
  }
}
