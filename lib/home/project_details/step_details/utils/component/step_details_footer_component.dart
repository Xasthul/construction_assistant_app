import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsFooterComponent extends StatefulWidget {
  const StepDetailsFooterComponent({super.key});

  @override
  State<StepDetailsFooterComponent> createState() => _StepDetailsFooterComponentState();
}

class _StepDetailsFooterComponentState extends State<StepDetailsFooterComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(builder: (context) {
        if (_store.step.completedBy != null) {
          return Text(
            AppLocalizations.of(context).stepDetailsCompletedByLabel(_store.step.completedBy!),
            style: AppTextTheme.of(context).headline2Bold.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          );
        }
        return AppFilledButtonComponent(
          title: AppLocalizations.of(context).stepDetailsCompleteStepButton,
          onPressed: _store.completeStep,
        );
      });
}
