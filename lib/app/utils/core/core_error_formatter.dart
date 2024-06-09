import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';

class CoreErrorFormatter {
  final AppLocalizations _appLocalizations = getIt<AppLocalizations>();

  String formatError(dynamic error) {
    if (error is CoreError) {
      return switch (error) {
        CoreProjectNotFoundError() => _appLocalizations.coreSomethingWentWrongError,
        CoreDeleteProjectFailedError() => _appLocalizations.coreSomethingWentWrongError,
        CoreUserNotFoundError() => _appLocalizations.coreSomethingWentWrongError,
        CoreUserAlreadyAddedToProjectError() => _appLocalizations.coreUserAlreadyAddedToProjectError,
        CoreUserNotAddedToProjectError() => _appLocalizations.coreSomethingWentWrongError,
        CoreWrongOldPasswordError() => _appLocalizations.coreWrongOldPasswordError,
        CoreDeleteUserFailedError() => _appLocalizations.coreSomethingWentWrongError,
        CoreStepNotFoundError() => _appLocalizations.coreSomethingWentWrongError,
        CoreDeleteStepFailedError() => _appLocalizations.coreSomethingWentWrongError,
        CoreStepWithPreviousOrderNotFoundError() => _appLocalizations.coreSomethingWentWrongError,
        CorePreviousStepNotCompletedError() => _appLocalizations.coreSomethingWentWrongError,
        CoreEmailAlreadyRegisteredError() => _appLocalizations.coreEmailAlreadyRegisteredError,
        CoreWrongCredentialsError() => _appLocalizations.coreWrongCredentialsError,
        CoreInvalidRefreshTokenError() => _appLocalizations.coreSomethingWentWrongError,
        CoreInvalidAccessTokenError() => _appLocalizations.coreInvalidAccessTokenError,
        CoreDeleteCreatorFromProjectError() => _appLocalizations.coreDeleteCreatorFromProjectError,
        _ => _appLocalizations.coreUnknownError,
      };
    }
    return _appLocalizations.coreUnknownError;
  }
}
