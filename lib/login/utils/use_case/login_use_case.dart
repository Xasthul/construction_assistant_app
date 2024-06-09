import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:construction_assistant_app/login/utils/service/login_service.dart';

class LoginUseCase {
  final LoginService _loginService = getIt<LoginService>();
  final SecureStorage _secureStorage = getIt<SecureStorage>();
  final CoreErrorHandler _coreErrorHandler = getIt<CoreErrorHandler>();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _loginService.signUp(
        name: name,
        email: email,
        password: password,
      );
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await _loginService.login(email: email, password: password);
      await _secureStorage.writeAccessToken(loginResponse.accessToken);
      await _secureStorage.writeRefreshToken(loginResponse.refreshToken);
    } catch (error) {
      _coreErrorHandler.throwErrorFrom(error);
    }
  }
}
