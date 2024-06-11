import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_action_button/app_action_button_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsAssetsButtonComponent extends StatefulWidget {
  const StepDetailsAssetsButtonComponent({super.key});

  @override
  State<StepDetailsAssetsButtonComponent> createState() => _StepDetailsAssetsButtonComponentState();
}

class _StepDetailsAssetsButtonComponentState extends State<StepDetailsAssetsButtonComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => AppActionButtonComponent(
          title: AppLocalizations.of(context).stepDetailsAssetsButton(_store.assetsCount),
          onPressed: HomeNavigator.of(context).navigateToStepDetailsAssets,
        ),
      );
}
