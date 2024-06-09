import 'package:construction_assistant_app/home/create_project/create_project_component.dart';
import 'package:construction_assistant_app/home/profile/profile_component.dart';
import 'package:construction_assistant_app/home/project_details/project_details_component.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends InheritedWidget {
  factory HomeNavigator({required Widget child}) {
    final navigationKey = GlobalKey<NavigatorState>();
    return HomeNavigator._(
      navigationKey: navigationKey,
      child: NavigatorPopHandler(
        onPop: () => navigationKey.currentState!.maybePop(),
        child: Navigator(
          key: navigationKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => child,
          ),
        ),
      ),
    );
  }

  const HomeNavigator._({
    required super.child,
    required GlobalKey<NavigatorState> navigationKey,
  }) : _navigationKey = navigationKey;
  final GlobalKey<NavigatorState> _navigationKey;

  static HomeNavigator of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<HomeNavigator>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => this != oldWidget;

  void pop() => _navigationKey.currentState?.pop();

  void maybePop() => _navigationKey.currentState?.maybePop();

  void popUntilFirst() => _navigationKey.currentState?.popUntil((route) => route.isFirst);

  void navigateToProfileComponent() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProfileComponent(),
        ),
      );

  void navigateToCreateProjectComponent() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateProjectComponent(),
        ),
      );

  void navigateToProjectDetails({required String projectId}) => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ProjectDetailsComponent(projectId: projectId),
        ),
      );
}
