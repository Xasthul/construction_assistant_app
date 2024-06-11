import 'package:construction_assistant_app/home/create_project/create_project_component.dart';
import 'package:construction_assistant_app/home/profile/profile_component.dart';
import 'package:construction_assistant_app/home/profile/utils/component/profile_change_password_component.dart';
import 'package:construction_assistant_app/home/profile/utils/component/profile_edit_name_component.dart';
import 'package:construction_assistant_app/home/project_details/create_step/create_step_component.dart';
import 'package:construction_assistant_app/home/project_details/create_step/utils/component/create_step_assets/create_step_assets_component.dart';
import 'package:construction_assistant_app/home/project_details/project_details_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_add_user_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_rename_component.dart';
import 'package:construction_assistant_app/home/project_details/project_settings/project_settings_users_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_details_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_settings/step_settings_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_settings/step_settings_rename_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_settings/step_settings_update_assets_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_settings/step_settings_update_details_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_assets/step_details_assets_component.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:flutter/material.dart' hide Step;

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

  static const String projectDetailsRouteName = 'projectDetails';

  void pop() => _navigationKey.currentState?.pop();

  void maybePop() => _navigationKey.currentState?.maybePop();

  void popUntilFirst() => _navigationKey.currentState?.popUntil((route) => route.isFirst);

  void popUntil(String name) => _navigationKey.currentState?.popUntil(
        ModalRoute.withName(name),
      );

  void navigateToProfile({required User user}) => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ProfileComponent(user: user),
        ),
      );

  void navigateToProfileEditName() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProfileEditNameComponent(),
        ),
      );

  void navigateToProfileChangePassword() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProfileChangePasswordComponent(),
        ),
      );

  void navigateToCreateProject() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateProjectComponent(),
        ),
      );

  void navigateToProjectDetails({required Project project}) => _navigationKey.currentState?.push(
        MaterialPageRoute(
          settings: const RouteSettings(name: projectDetailsRouteName),
          builder: (context) => ProjectDetailsComponent(project: project),
        ),
      );

  void navigateToCreateStep({required Project project}) => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => CreateStepComponent(project: project),
        ),
      );

  void navigateToCreateStepAssets() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateStepAssetsComponent(),
        ),
      );

  void navigateToProjectSettings() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const ProjectSettingsComponent(),
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

  void navigateToStepDetails({
    required Project project,
    required Step step,
  }) =>
      _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => StepDetailsComponent(
            project: project,
            step: step,
          ),
        ),
      );

  void navigateToStepDetailsAssets() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const StepDetailsAssetsComponent(),
        ),
      );

  void navigateToStepSettings() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const StepSettingsComponent(),
        ),
      );

  void navigateToStepSettingsRename() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const StepSettingsRenameComponent(),
        ),
      );

  void navigateToStepSettingsUpdateDetails() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const StepSettingsUpdateDetailsComponent(),
        ),
      );

  void navigateToStepSettingsUpdateAssets() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const StepSettingsUpdateAssetsComponent(),
        ),
      );
}
