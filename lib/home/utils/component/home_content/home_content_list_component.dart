import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/component/home_content/home_content_list_item_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeContentListComponent extends StatefulWidget {
  const HomeContentListComponent({super.key});

  @override
  State<HomeContentListComponent> createState() => _HomeContentListComponentState();
}

class _HomeContentListComponentState extends State<HomeContentListComponent> {
  final HomeStore _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Expanded(
          child: ListView.separated(
            itemCount: _store.projectsCount,
            itemBuilder: (context, index) => HomeContentListItemComponent(
              projectName: _store.projects[index].title,
              onPressed: () => HomeNavigator.of(context).navigateToProjectDetails(projectId: _store.projects[index].id),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          ),
        ),
      );
}
