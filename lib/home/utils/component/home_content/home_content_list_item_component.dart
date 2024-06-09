import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:flutter/material.dart';

class HomeContentListItemComponent extends StatelessWidget {
  const HomeContentListItemComponent({
    super.key,
    required String projectName,
    required VoidCallback onPressed,
  })  : _projectName = projectName,
        _onPressed = onPressed;

  final String _projectName;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) => AppActionButtonComponent(
        title: _projectName,
        onPressed: _onPressed,
      );
}
