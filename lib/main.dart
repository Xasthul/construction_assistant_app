import 'package:construction_assistant_app/app/app_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ConstructionAssistantApp());

class ConstructionAssistantApp extends StatelessWidget {
  const ConstructionAssistantApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: AppLocalizations.of(context).constructionAssistantAppTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppComponent(),
      );
}
