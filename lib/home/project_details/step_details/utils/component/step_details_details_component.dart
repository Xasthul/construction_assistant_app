import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class StepDetailsDetailsComponent extends StatefulWidget {
  const StepDetailsDetailsComponent({super.key});

  @override
  State<StepDetailsDetailsComponent> createState() => _StepDetailsDetailsComponentState();
}

class _StepDetailsDetailsComponentState extends State<StepDetailsDetailsComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppLocalizations.of(context).stepDetailsDetailsLabel,
            style: AppTextTheme.of(context).headline1Regular.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            _store.step.details,
            style: AppTextTheme.of(context).body1Regular.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          ),
        ]),
      );
}
