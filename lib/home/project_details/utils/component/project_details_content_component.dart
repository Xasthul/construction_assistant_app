import 'package:construction_assistant_app/home/project_details/utils/component/project_details_header_component.dart';
import 'package:flutter/material.dart';

class ProjectDetailsContentComponent extends StatelessWidget {
  const ProjectDetailsContentComponent({super.key});

  @override
  Widget build(BuildContext context) => const Column(children: [
        SizedBox(height: 20),
        ProjectDetailsHeaderComponent(),
      ]);
}
