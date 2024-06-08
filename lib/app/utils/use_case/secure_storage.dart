import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage = getIt<FlutterSecureStorage>();

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  Future<String?> readAccessToken() async => _flutterSecureStorage.read(key: _accessTokenKey);

  Future<void> writeAccessToken(String accessToken) async => _flutterSecureStorage.write(
        key: _accessTokenKey,
        value: accessToken,
      );

  Future<String?> readRefreshToken() async => _flutterSecureStorage.read(key: _refreshTokenKey);

  Future<void> writeRefreshToken(String refreshToken) async => _flutterSecureStorage.write(
        key: _refreshTokenKey,
        value: refreshToken,
      );
}
