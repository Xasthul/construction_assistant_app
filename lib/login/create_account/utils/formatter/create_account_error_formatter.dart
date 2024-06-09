import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_confirm_password_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_email_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_name_error.dart';
import 'package:construction_assistant_app/login/create_account/utils/entity/create_account_password_error.dart';

class CreateAccountErrorFormatter {
  final AppLocalizations _appLocalizations = getIt<AppLocalizations>();

  String? getNameErrorStringFrom(CreateAccountNameError nameError) => switch (nameError) {
        CreateAccountNameError.invalid => _appLocalizations.createAccountEnterAValidNameError,
        _ => null,
      };

  String? getEmailErrorStringFrom(CreateAccountEmailError emailError) => switch (emailError) {
        CreateAccountEmailError.invalid => _appLocalizations.createAccountEnterAValidEmailError,
        _ => null,
      };

  String? getPasswordErrorStringFrom(CreateAccountPasswordError passwordError) => switch (passwordError) {
        CreateAccountPasswordError.invalid => _appLocalizations.createAccountMinimumCharactersLongError,
        _ => null,
      };

  String? getConfirmPasswordErrorStringFrom(CreateAccountConfirmPasswordError repeatedPasswordError) =>
      switch (repeatedPasswordError) {
        CreateAccountConfirmPasswordError.notMatched => _appLocalizations.createAccountPasswordsDontMatchError,
        _ => null,
      };
}
