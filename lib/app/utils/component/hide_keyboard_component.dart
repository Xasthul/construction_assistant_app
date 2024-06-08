import 'package:flutter/material.dart';

class HideKeyboardComponent extends StatelessWidget {
  const HideKeyboardComponent({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: _child,
      );
}
