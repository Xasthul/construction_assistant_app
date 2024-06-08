import 'package:dio/dio.dart';

abstract class DioClientWrapper {
  DioClientWrapper({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.get<dynamic>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _dio.post<dynamic>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
      data: body,
    );
    if (response.data is String || (response.statusCode == 204 && response.data == null)) {
      return <String, dynamic>{};
    }
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _dio.put<dynamic>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
      data: body,
    );
    if (response.data is String || (response.statusCode == 204 && response.data == null)) {
      return <String, dynamic>{};
    }
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, String>? params,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _dio.delete<dynamic>(
      url,
      queryParameters: params,
      options: Options(headers: headers),
      data: body,
    );
    if (response.data is String || (response.statusCode == 204 && response.data == null)) {
      return <String, dynamic>{};
    }
    return response.data as Map<String, dynamic>;
  }
}
