import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/profile/profile_dependencies.dart';
import 'package:construction_assistant_app/home/profile/store/profile_store.dart';
import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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

class _ProfileComponentBaseState extends State<_ProfileComponentBase> with ReactionDispose, AfterLayout {
  final ProfileStore _store = getIt<ProfileStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.errorMessage, (String? errorMessage) {
          if (errorMessage != null) {
            ScaffoldMessenger.of(context).showAppErrorSnackBar(
              context: context,
              title: errorMessage,
            );
            _store.resetErrorMessage();
          }
        }),
      );

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
                onPressed: HomeNavigator.of(context).navigateToProfileEditName,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileChangePasswordButton,
                onPressed: HomeNavigator.of(context).navigateToProfileChangePassword,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileLogoutButton,
                onPressed: _store.logout,
              ),
              const SizedBox(height: 12),
              AppActionButtonComponent(
                title: AppLocalizations.of(context).profileDeleteAccountButton,
                onPressed: _store.deleteAccount,
                isWarning: true,
              ),
              const SizedBox(height: 12),
            ]),
          ),
        ),
      );
}
