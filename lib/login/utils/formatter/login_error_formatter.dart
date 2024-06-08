import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:dio/dio.dart';

class LoginErrorFormatter {
  final AppLocalizations _appLocalizations = getIt<AppLocalizations>();

  String formatError(dynamic error) {
    if (error is! DioException) {
      return _appLocalizations.coreErrorSomethingWentWrong;
    }
    return switch (error.response?.statusCode) {
      401 => _appLocalizations.coreErrorCredentialsIncorrect,
      _ => _appLocalizations.coreErrorSomethingWentWrong
    };
  }
}
