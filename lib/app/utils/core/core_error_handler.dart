import 'package:construction_assistant_app/app/utils/core/core_error.dart';

class CoreErrorHandler {
  Never throwErrorFrom({required int errorCode}) => switch (errorCode) {
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
