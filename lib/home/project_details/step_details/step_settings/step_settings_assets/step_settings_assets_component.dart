import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_circular_progress_indicator_component.dart';
import 'package:construction_assistant_app/app/utils/helpers/after_layout.dart';
import 'package:construction_assistant_app/app/utils/helpers/reaction_dispose.dart';
import 'package:construction_assistant_app/home/project_details/step_details/step_settings/step_settings_assets/step_settings_assets_content_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class StepSettingsAssetsComponent extends StatefulWidget {
  const StepSettingsAssetsComponent({super.key});

  @override
  State<StepSettingsAssetsComponent> createState() => _StepSettingsAssetsComponentState();
}

class _StepSettingsAssetsComponentState extends State<StepSettingsAssetsComponent> with ReactionDispose, AfterLayout {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  void afterLayout(BuildContext context) => disposers.add(
        reaction((_) => _store.areAssetsUpdatedSuccessfully, (bool areAssetsUpdatedSuccessfully) {
          if (areAssetsUpdatedSuccessfully) {
            HomeNavigator.of(context).pop();
            _store.resetAreAssetsUpdatedSuccessfully();
          }
        }),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).stepSettingsAssetsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Observer(
            builder: (context) => Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _store.isLoadingAsset
                    ? const Center(
                        child: AppCircularProgressIndicatorComponent(),
                      )
                    : const StepSettingsAssetsContentComponent(),
              ),
              if (_store.isUpdateAssetsLoading)
                IgnorePointer(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    // TODO(naz): move to themes
                    color: Colors.white.withOpacity(0.6),
                    child: const AppCircularProgressIndicatorComponent(),
                  ),
                ),
            ]),
          ),
        ),
      );

  @override
  void dispose() {
    _store.resetUpdateAssets();
    super.dispose();
  }
}
