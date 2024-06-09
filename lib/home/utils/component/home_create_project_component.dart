import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/store/home_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeCreateProjectComponent extends StatefulWidget {
  const HomeCreateProjectComponent({super.key});

  @override
  State<HomeCreateProjectComponent> createState() => _HomeCreateProjectComponentState();
}

class _HomeCreateProjectComponentState extends State<HomeCreateProjectComponent> {
  final HomeStore _store = getIt<HomeStore>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).homeCreateProjectTitle,
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
                title: AppLocalizations.of(context).homeProjectNameLabel,
                hint: AppLocalizations.of(context).homeEnterProjectNameHint,
                controller: _controller,
                maxLength: 30,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 32),
              AppFilledButtonComponent(
                title: AppLocalizations.of(context).homeCreateProjectButton,
                onPressed: () => _store.createProject(projectName: _controller.text),
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
