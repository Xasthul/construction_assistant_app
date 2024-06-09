sealed class CoreError implements Exception {}

class CoreProjectNotFoundError extends CoreError {}

class CoreDeleteProjectFailedError extends CoreError {}

class CoreUserNotFoundError extends CoreError {}

class CoreUserAlreadyAddedToProjectError extends CoreError {}

class CoreUserNotAddedToProjectError extends CoreError {}

class CoreWrongOldPasswordError extends CoreError {}

class CoreDeleteUserFailedError extends CoreError {}

class CoreStepNotFoundError extends CoreError {}

class CoreDeleteStepFailedError extends CoreError {}

class CoreStepWithPreviousOrderNotFoundError extends CoreError {}

class CorePreviousStepNotCompletedError extends CoreError {}

class CoreEmailAlreadyRegisteredError extends CoreError {}

class CoreWrongCredentialsError extends CoreError {}

class CoreInvalidRefreshTokenError extends CoreError {}

class CoreInvalidAccessTokenError extends CoreError {}

class CoreDeleteCreatorFromProjectError extends CoreError {}

class CoreUnknownError extends CoreError {}
