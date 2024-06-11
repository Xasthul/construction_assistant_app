import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsNameComponent extends StatefulWidget {
  const StepDetailsNameComponent({super.key});

  @override
  State<StepDetailsNameComponent> createState() => _StepDetailsNameComponentState();
}

class _StepDetailsNameComponentState extends State<StepDetailsNameComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Observer(
          builder: (context) => RichText(
            text: TextSpan(children: [
              TextSpan(
                text: AppLocalizations.of(context).stepDetailsNameLabel,
                style: AppTextTheme.of(context).headline1Regular.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
              ),
              TextSpan(
                text: _store.step.title,
                style: AppTextTheme.of(context).headline1Bold.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
              ),
            ]),
          ),
        ),
      );
}
