import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/home/profile/profile_dependencies.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) => const ProfileDependencies(
        child: _ProfileComponentBase(),
      );
}

class _ProfileComponentBase extends StatefulWidget {
  const _ProfileComponentBase();

  @override
  State<_ProfileComponentBase> createState() => _ProfileComponentBaseState();
}

class _ProfileComponentBaseState extends State<_ProfileComponentBase> {
  final ProfileStore _store = getIt<ProfileStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: AppFilledButtonComponent(
            title: AppLocalizations.of(context).profileLogoutButton,
            onPressed: _store.logout,
          ),
        ),
      );
}
