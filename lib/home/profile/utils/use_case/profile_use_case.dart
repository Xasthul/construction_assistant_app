import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/mapper/users_mapper.dart';
import 'package:construction_assistant_app/home/utils/service/users_service.dart';

class ProfileUseCase {
  final UsersService _usersService = getIt<UsersService>();
  final UsersMapper _usersMapper = getIt<UsersMapper>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<User> getUserDetails() async {
    try {
      final response = await _usersService.getUserDetails();
      return _usersMapper.mapUserResponseToDomain(response);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> updateUserName({required String newName}) async {
    try {
      await _usersService.updateUserName(newName: newName);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> updateUserPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await _usersService.updateUserPassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> logout() async {
    try {
      await _usersService.logout();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> deleteAccount() async {
    try {
      await _usersService.deleteAccount();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }
}
