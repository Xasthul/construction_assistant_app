import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/store/app_store.dart';
import 'package:construction_assistant_app/app/utils/entity/app_navigation_state.dart';
import 'package:construction_assistant_app/home/home_component.dart';
import 'package:construction_assistant_app/login/login_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppComponent extends StatelessWidget {
  const AppComponent({super.key});

  @override
  Widget build(BuildContext context) => const AppDependencies(
        child: _AppComponentBase(),
      );
}

class _AppComponentBase extends StatefulWidget {
  const _AppComponentBase();

  @override
  State<_AppComponentBase> createState() => _AppComponentBaseState();
}

class _AppComponentBaseState extends State<_AppComponentBase> {
  final AppStore _store = getIt<AppStore>();

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => switch (_store.navigationState) {
            AppNavigationState.login => const LoginComponent(),
            AppNavigationState.home => const HomeComponent()
          });
}
