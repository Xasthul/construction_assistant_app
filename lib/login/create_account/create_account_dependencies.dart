import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/login/create_account/store/create_account_store.dart';
import 'package:construction_assistant_app/login/create_account/utils/formatter/create_account_error_formatter.dart';
import 'package:construction_assistant_app/login/create_account/utils/validation/create_account_validator.dart';
import 'package:flutter/material.dart';

class CreateAccountDependencies extends StatefulWidget {
  const CreateAccountDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<CreateAccountDependencies> createState() => _CreateAccountDependenciesState();
}

class _CreateAccountDependenciesState extends State<CreateAccountDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<CreateAccountValidator>(() => CreateAccountValidator());
    getIt.registerLazySingleton<CreateAccountErrorFormatter>(() => CreateAccountErrorFormatter());
    getIt.registerLazySingleton<CreateAccountStore>(() => CreateAccountStore());
  }
}
