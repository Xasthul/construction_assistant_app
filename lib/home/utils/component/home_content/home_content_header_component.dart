import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/component/header_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeContentHeaderComponent extends StatefulWidget {
  const HomeContentHeaderComponent({super.key});

  @override
  State<HomeContentHeaderComponent> createState() => _HomeContentHeaderComponentState();
}

class _HomeContentHeaderComponentState extends State<HomeContentHeaderComponent> {
  final HomeStore _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => HeaderComponent(
          title: AppLocalizations.of(context).homeProjectsCount(_store.projectsCount),
          buttonTitle: AppLocalizations.of(context).homeCreateNewProjectButton,
          onPressed: HomeNavigator.of(context).navigateToCreateProject,
        ),
      );
}
