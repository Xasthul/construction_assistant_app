import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/mapper/home_mapper.dart';
import 'package:construction_assistant_app/home/utils/mapper/users_mapper.dart';
import 'package:construction_assistant_app/home/utils/service/home_service.dart';
import 'package:construction_assistant_app/home/utils/service/users_service.dart';

class HomeUseCase {
  final HomeService _homeService = getIt<HomeService>();
  final UsersService _usersService = getIt<UsersService>();
  final UsersMapper _usersMapper = getIt<UsersMapper>();
  final HomeMapper _homeMapper = getIt<HomeMapper>();
  final SecureStorage _secureStorage = getIt<SecureStorage>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<User> getUserDetails() async {
    try {
      final response = await _usersService.getUserDetails();
      return _usersMapper.mapUserResponseToDomain(response);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<List<Project>> loadProjects() async {
    try {
      final projectsResponse = await _homeService.getProjects();
      return projectsResponse
          .map(
            (projectResponse) => _homeMapper.mapProjectResponseToDomain(projectResponse),
          )
          .toList();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> createProject({required String projectName}) async {
    try {
      await _homeService.createProject(projectName: projectName);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> logout() async {
    try {
      await _secureStorage.removeTokens();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }
}
