import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';

class HomeUseCase {
  final SecureStorage _secureStorage = getIt<SecureStorage>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<List<Project>> loadProjects() async {
    try {
      await _secureStorage.removeTokens();
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
    return [];
  }
}
