import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';

class HomeUseCase {
  final SecureStorage _secureStorage = getIt<SecureStorage>();

  Future<void> logout() async => _secureStorage.removeTokens();
}
