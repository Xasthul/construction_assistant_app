import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/extension/app_snackbar_extension.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/create_project/create_project_dependencies.dart';
import 'package:construction_assistant_app/home/create_project/store/create_project_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CreateProjectComponent extends StatelessWidget {
  const CreateProjectComponent({super.key});

  @override
  Widget build(BuildContext context) => const CreateProjectDependencies(
        child: _CreateProjectComponentBase(),
      );
}

class _CreateProjectComponentBase extends StatefulWidget {
  const _CreateProjectComponentBase();

  @override
  State<_CreateProjectComponentBase> createState() => _CreateProjectComponentBaseState();
}

class _CreateProjectComponentBaseState extends State<_CreateProjectComponentBase> with ReactionDispose, AfterLayout {
  final CreateProjectStore _store = getIt<CreateProjectStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void afterLayout(BuildContext context) => disposers.addAll([
        reaction((_) => _store.errorMessage, (String? errorMessage) {
          if (errorMessage != null) {
            ScaffoldMessenger.of(context).showAppErrorSnackBar(
              context: context,
              title: errorMessage,
              shouldHideKeyboard: true,
            );
            _store.resetErrorMessage();
          }
        }),
        reaction((_) => _store.isProjectCreatedSuccessfully, (bool isProjectCreatedSuccessfully) {
          if (isProjectCreatedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetIsProjectCreatedSuccessfully();
          }
        }),
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).createProjectTitle,
            style: AppTextTheme.of(context).largeTitleBold.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          ),
          leading: BackButton(
            onPressed: HomeNavigator.of(context).pop,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(height: 40),
              AppTextFieldComponent(
                title: AppLocalizations.of(context).createProjectNameLabel,
                hint: AppLocalizations.of(context).createProjectEnterProjectNameHint,
                controller: _controller,
                maxLength: 30,
                textInputAction: TextInputAction.done,
                onChanged: _store.updateProjectName,
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (context) => AppFilledButtonComponent(
                  title: AppLocalizations.of(context).createProjectCreateButton,
                  onPressed: _store.isCreateProjectButtonEnabled ? _store.createProject : null,
                ),
              ),
              const SizedBox(height: 16),
            ]),
          ),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
