import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

mixin ReactionDispose<T extends StatefulWidget> on State<T> {
  final List<ReactionDisposer> disposers = [];

  @override
  @mustCallSuper
  void dispose() {
    for (final element in disposers) {
      element();
    }
    super.dispose();
  }
}
