import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/profile/profile_dependencies.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    super.key,
    required User user,
  }) : _user = user;

  final User _user;

  @override
  Widget build(BuildContext context) => ProfileDependencies(
        user: _user,
        child: const _ProfileComponentBase(),
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
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).profileTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(height: 20),
              Observer(
                builder: (context) => Text(
                  _store.user.name,
                  style: AppTextTheme.of(context).largeTitleBold.copyWith(
                        color: CommonColorTheme.of(context).titleTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 4),
              Observer(
                builder: (context) => Text(
                  _store.user.email,
                  style: AppTextTheme.of(context).body1Regular.copyWith(
                        color: CommonColorTheme.of(context).titleTextColor,
                      ),
                ),
              ),
              const SizedBox(height: 32),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileEditNameButton,
                onPressed: HomeNavigator.of(context).navigateToProjectSettingsRename,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileChangePasswordButton,
                onPressed: HomeNavigator.of(context).navigateToProjectSettingsRename,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileLogoutButton,
                onPressed: HomeNavigator.of(context).navigateToProjectSettingsUsers,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileDeleteAccountButton,
                onPressed: () {},
                isWarning: true,
              ),
              const SizedBox(height: 12),
            ]),
          ),
        ),
      );
}
