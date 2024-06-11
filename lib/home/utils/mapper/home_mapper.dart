import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/mapper/users_mapper.dart';
import 'package:construction_assistant_app/home/utils/network/project_response.dart';
import 'package:construction_assistant_app/home/utils/network/step_response.dart';

class HomeMapper {
  final UsersMapper _usersMapper = getIt<UsersMapper>();

  Project mapProjectResponseToDomain(ProjectResponse projectResponse) => Project(
        id: projectResponse.id,
        title: projectResponse.title,
        users: projectResponse.users.map((userResponse) => _usersMapper.mapUserResponseToDomain(userResponse)).toList(),
        isOwner: projectResponse.isOwner,
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
