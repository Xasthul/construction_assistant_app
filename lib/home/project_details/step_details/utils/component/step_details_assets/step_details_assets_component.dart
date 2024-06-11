import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/component/step_details_assets/step_details_assets_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsAssetsComponent extends StatefulWidget {
  const StepDetailsAssetsComponent({super.key});

  @override
  State<StepDetailsAssetsComponent> createState() => _StepDetailsAssetsComponentState();
}

class _StepDetailsAssetsComponentState extends State<StepDetailsAssetsComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).stepDetailsAssetsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (context) {
                if (_store.assets.isNotEmpty) {
                  return const StepDetailsAssetsContentComponent();
                } else {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context).stepDetailsNoAssetsAddedLabel,
                      style: AppTextTheme.of(context).largeTitleBold.copyWith(
                            color: CommonColorTheme.of(context).titleTextColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );
}
