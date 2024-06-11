import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsOrderComponent extends StatefulWidget {
  const StepDetailsOrderComponent({super.key});

  @override
  State<StepDetailsOrderComponent> createState() => _StepDetailsOrderComponentState();
}

class _StepDetailsOrderComponentState extends State<StepDetailsOrderComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Observer(
          builder: (context) => Text(
            AppLocalizations.of(context).stepDetailsOrderLabel(_store.step.order),
            style: AppTextTheme.of(context).headline1Regular.copyWith(
                  color: CommonColorTheme.of(context).titleTextColor,
                ),
          ),
        ),
      );
}
