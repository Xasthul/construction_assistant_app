import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';

class ProfileUseCase {
  final SecureStorage _secureStorage = getIt<SecureStorage>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();
}
