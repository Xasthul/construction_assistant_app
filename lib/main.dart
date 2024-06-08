import 'package:construction_assistant_app/app/app_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_theme.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const ConstructionAssistantApp());
}

class ConstructionAssistantApp extends StatelessWidget {
  const ConstructionAssistantApp({super.key});

  @override
  Widget build(BuildContext context) => AppTheme(
        child: Builder(
          builder: (context) => MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context).constructionAssistantAppTitle,
            theme: AppTheme.of(context).themeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const AppComponent(),
          ),
        ),
      );
}
