import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) => const Placeholder();
}
