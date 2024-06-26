import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_authorized_client.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/app/utils/network/response/refresh_token_response.dart';
import 'package:construction_assistant_app/home/utils/network/user_response.dart';

class UsersService {
  final DioAuthorizedClient _client = getIt<DioAuthorizedClient>();

  Future<UserResponse> getUserDetails() async {
    final response = await _client.get('${AppConstants.serviceUrl}/users');
    final appDataResponse = AppDataResponse.fromJson(response);
    return UserResponse.fromJson(appDataResponse.data as Map<String, dynamic>);
  }

  Future<void> updateUserName({required String newName}) async => _client.put(
        '${AppConstants.serviceUrl}/users/change-name',
        body: {'newName': newName},
      );

  Future<RefreshTokenResponse> updateUserPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await _client.put(
        '${AppConstants.serviceUrl}/users/change-password',
        body: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );
    final appDataResponse = AppDataResponse.fromJson(response);
    return RefreshTokenResponse.fromJson(appDataResponse.data as Map<String, dynamic>);
  }

  Future<void> logout() async => _client.post('${AppConstants.serviceUrl}/users/logout');

  Future<void> deleteAccount() async => _client.delete('${AppConstants.serviceUrl}/users');
}
