import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:construction_assistant_app/login/utils/service/login_service.dart';

class LoginUseCase {
  final LoginService _loginService = getIt<LoginService>();
  final SecureStorage _secureStorage = getIt<SecureStorage>();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async =>
      _loginService.signUp(
        name: name,
        email: email,
        password: password,
      );

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final loginResponse = await _loginService.login(email: email, password: password);
    await _secureStorage.writeAccessToken(loginResponse.accessToken);
    await _secureStorage.writeRefreshToken(loginResponse.refreshToken);
  }
}
