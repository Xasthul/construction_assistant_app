import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/scrollable_content_component.dart';
import 'package:construction_assistant_app/home/home_dependencies.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) => HomeDependencies(
        child: HomeNavigator(
          child: const _HomeComponentBase(),
        ),
      );
}

class _HomeComponentBase extends StatefulWidget {
  const _HomeComponentBase();

  @override
  State<_HomeComponentBase> createState() => _HomeComponentBaseState();
}

class _HomeComponentBaseState extends State<_HomeComponentBase> {
  final HomeStore _store = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ScrollableContentComponent(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: AppFilledButtonComponent(
                  title: AppLocalizations.of(context).homeLogoutButton,
                  onPressed: _store.logout,
                ),
              ),
            ),
          ),
        ),
      );
}
