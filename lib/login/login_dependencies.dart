import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/store/app_store.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/app/utils/notifier/app_navigation_state_notifier.dart';
import 'package:construction_assistant_app/login/store/login_store.dart';
import 'package:construction_assistant_app/login/utils/formatter/login_error_formatter.dart';
import 'package:construction_assistant_app/login/utils/service/login_service.dart';
import 'package:construction_assistant_app/login/utils/use_case/login_use_case.dart';
import 'package:construction_assistant_app/login/utils/validation/login_validator.dart';
import 'package:flutter/material.dart';

class LoginDependencies extends StatefulWidget {
  const LoginDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<LoginDependencies> createState() => _LoginDependenciesState();
}

class _LoginDependenciesState extends State<LoginDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<LoginService>(() => LoginService());
    getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
    getIt.registerLazySingleton<LoginValidator>(() => LoginValidator());
    getIt.registerLazySingleton<LoginErrorFormatter>(() => LoginErrorFormatter());
    getIt.registerLazySingleton<AppNavigationStateNotifier>(() => getIt<AppStore>());
    getIt.registerLazySingleton<LoginStore>(() => LoginStore());
  }
}
