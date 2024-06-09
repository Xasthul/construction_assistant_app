import 'package:construction_assistant_app/home/utils/component/home_content/home_content_header_component.dart';
import 'package:construction_assistant_app/home/utils/component/home_content/home_content_list_component.dart';
import 'package:flutter/material.dart';

class HomeContentComponent extends StatelessWidget {
  const HomeContentComponent({super.key});

  @override
  Widget build(BuildContext context) => const Expanded(
        child: Column(children: [
          SizedBox(height: 20),
          HomeContentHeaderComponent(),
          SizedBox(height: 24),
          HomeContentListComponent(),
          SizedBox(height: 16),
        ]),
      );
}
