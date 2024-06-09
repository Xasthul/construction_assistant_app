import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_client_wrapper.dart';
import 'package:construction_assistant_app/app/utils/network/response/access_token_response.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/app/utils/network/response/core_error_response.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:dio/dio.dart';

class DioAuthorizedClient extends DioClientWrapper {
  DioAuthorizedClient({required super.dio}) : _dio = dio;

  final Dio _dio;
  final SecureStorage _secureStorage = getIt<SecureStorage>();

  static const int _coreInvalidAccessTokenErrorCode = 15;

  void addRefreshTokenInterceptor() => _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _secureStorage.readAccessToken();
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 &&
              e.response?.data != null &&
              CoreErrorResponse.fromJson(e.response?.data as Map<String, dynamic>).errorCode ==
                  _coreInvalidAccessTokenErrorCode) {
            final newAccessToken = await _refreshAccessToken();
            if (newAccessToken == null) {
              return handler.next(e);
            }
            e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ));

  Future<String?> _refreshAccessToken() async {
    final refreshToken = await _secureStorage.readRefreshToken();
    if (refreshToken == null) {
      return null;
    }
    try {
      final response = await super.post(
        '${AppConstants.serviceUrl}/auth/refresh-token',
        params: {'refreshToken': refreshToken},
      );
      final appDataResponse = AppDataResponse.fromJson(response);
      final accessToken = AccessTokenResponse.fromJson(appDataResponse.data as Map<String, dynamic>).accessToken;
      await _secureStorage.writeAccessToken(accessToken);
      return accessToken;
    } catch (error) {
      return null;
    }
  }
}
