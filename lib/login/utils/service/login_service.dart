import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_general_client.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/login/utils/network/login_response.dart';

class LoginService {
  final DioGeneralClient _client = getIt<DioGeneralClient>();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async =>
      _client.post(
        '${AppConstants.serviceUrl}/auth/signup',
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      '${AppConstants.serviceUrl}/auth/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    final appDataResponse = AppDataResponse.fromJson(response);
    return LoginResponse.fromJson(appDataResponse.data);
  }
}
