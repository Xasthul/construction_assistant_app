import 'package:construction_assistant_app/home/create_project/create_project_component.dart';
import 'package:construction_assistant_app/home/profile/profile_component.dart';
import 'package:construction_assistant_app/home/project_details/create_step/create_step_component.dart';
import 'package:construction_assistant_app/home/project_details/project_details_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_add_user_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_rename_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_users_component.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
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

  void navigateToProfile() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProfileComponent(),
        ),
      );

  void navigateToCreateProject() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateProjectComponent(),
        ),
      );

  void navigateToProjectDetails({required Project project}) => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ProjectDetailsComponent(project: project),
        ),
      );

  void navigateToCreateStep() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateStepComponent(),
        ),
      );

  void navigateToProjectSettings() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProjectDetailsSettingsComponent(),
        ),
      );

  void navigateToProjectSettingsRename() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProjectSettingsRenameComponent(),
        ),
      );

  void navigateToProjectSettingsUsers() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProjectSettingsUsersComponent(),
        ),
      );

  void navigateToProjectSettingsAddUser() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProjectSettingsAddUserComponent(),
        ),
      );
}
