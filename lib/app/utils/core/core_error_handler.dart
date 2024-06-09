import 'package:construction_assistant_app/app/utils/core/core_error.dart';
import 'package:construction_assistant_app/app/utils/network/response/core_error_response.dart';
import 'package:dio/dio.dart';

class CoreErrorHandler {
  Never throwErrorFrom(dynamic error) {
    if (error is! DioException || error.response?.data == null) {
      throw CoreUnknownError();
    }
    final errorResponse = CoreErrorResponse.fromJson(error.response?.data as Map<String, dynamic>);
    return switch (errorResponse.errorCode) {
      1 => throw CoreProjectNotFoundError(),
      2 => throw CoreDeleteProjectFailedError(),
      3 => throw CoreUserNotFoundError(),
      4 => throw CoreUserAlreadyAddedToProjectError(),
      5 => throw CoreUserNotAddedToProjectError(),
      6 => throw CoreWrongOldPasswordError(),
      7 => throw CoreDeleteUserFailedError(),
      8 => throw CoreStepNotFoundError(),
      9 => throw CoreDeleteStepFailedError(),
      10 => throw CoreStepWithPreviousOrderNotFoundError(),
      11 => throw CorePreviousStepNotCompletedError(),
      12 => throw CoreEmailAlreadyRegisteredError(),
      13 => throw CoreWrongCredentialsError(),
      14 => throw CoreInvalidRefreshTokenError(),
      _ => throw CoreUnknownError(),
    };
  }
}
