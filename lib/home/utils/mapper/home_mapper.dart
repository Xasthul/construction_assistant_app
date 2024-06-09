import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/network/project_response.dart';
import 'package:construction_assistant_app/home/utils/network/step_response.dart';
import 'package:construction_assistant_app/home/utils/network/user_response.dart';

class HomeMapper {
  Project mapProjectResponseToDomain(ProjectResponse projectResponse) => Project(
        id: projectResponse.id,
        title: projectResponse.title,
        users: projectResponse.users.map((userResponse) => mapUserResponseToDomain(userResponse)).toList(),
        createdBy: projectResponse.createdBy,
      );

  User mapUserResponseToDomain(UserResponse userResponse) => User(
        name: userResponse.name,
        email: userResponse.email,
      );

  Step mapStepResponseToDomain(StepResponse stepResponse) => Step(
        id: stepResponse.id,
        projectId: stepResponse.projectId,
        title: stepResponse.title,
        details: stepResponse.details,
        assets: stepResponse.assets,
        order: stepResponse.order,
        isCompleted: stepResponse.isCompleted,
        completedBy: stepResponse.completedBy,
      );
}
