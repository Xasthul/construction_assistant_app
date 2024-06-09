import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_circular_progress_indicator_component.dart';
import 'package:construction_assistant_app/home/home_dependencies.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/component/home_empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/component/home_header_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) =>
      HomeDependencies(
        child: HomeNavigator(
          child: const _HomeComponentBase(),
        ),
      );
}

class _HomeComponentBase extends StatefulWidget {
  const _HomeComponentBase();

  @override
  State<_HomeComponentBase> createState() => _HomeComponentBaseState();
}

class _HomeComponentBaseState extends State<_HomeComponentBase> {
  final HomeStore _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (context) {
                if (_store.isLoading) {
                  return const Center(
                    child: AppCircularProgressIndicatorComponent(),
                  );
                }
                return Column(children: [
                  const SizedBox(height: 8),
                  const HomeHeaderComponent(),
                  const SizedBox(height: 8),
                  if (_store.projects.isNotEmpty) const SizedBox() //
                  else
                    const HomeEmptyContentComponent(),
                ]);
              },
            ),
          ),
        ),
      );
}
