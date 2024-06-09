import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectDetailsNameComponent extends StatefulWidget {
  const ProjectDetailsNameComponent({super.key});

  @override
  State<ProjectDetailsNameComponent> createState() => _ProjectDetailsNameComponentState();
}

class _ProjectDetailsNameComponentState extends State<ProjectDetailsNameComponent> {
  final ProjectDetailsStore _store = getIt<ProjectDetailsStore>();

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Observer(
          builder: (context) => RichText(
            text: TextSpan(children: [
              TextSpan(
                text: AppLocalizations.of(context).projectDetailsNameLabel,
                style: AppTextTheme.of(context).headline1Regular.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
              ),
              TextSpan(
                text: _store.project.title,
                style: AppTextTheme.of(context).headline1Bold.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
              ),
            ]),
          ),
        ),
      );
}
