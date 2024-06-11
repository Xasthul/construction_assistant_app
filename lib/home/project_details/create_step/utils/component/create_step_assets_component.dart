import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_circular_progress_indicator_component.dart';
import 'package:construction_assistant_app/home/project_details/create_step/store/create_step_store.dart';
import 'package:construction_assistant_app/home/project_details/create_step/utils/component/create_step_assets_content_component.dart';
import 'package:construction_assistant_app/home/project_details/create_step/utils/component/create_step_assets_empty_content_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateStepAssetsComponent extends StatefulWidget {
  const CreateStepAssetsComponent({super.key});

  @override
  State<CreateStepAssetsComponent> createState() => _CreateStepAssetsComponentState();
}

class _CreateStepAssetsComponentState extends State<CreateStepAssetsComponent> {
  final CreateStepStore _store = getIt<CreateStepStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarComponent(
          title: AppLocalizations.of(context).createStepAssetsTitle,
          onBackButtonPressed: HomeNavigator.of(context).pop,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (context) {
                if (_store.isLoadingAsset) {
                  return const Center(
                    child: AppCircularProgressIndicatorComponent(),
                  );
                }
                if (_store.assets.isNotEmpty) {
                  return const CreateStepAssetsContentComponent();
                } else {
                  return const CreateStepAssetsEmptyContentComponent();
                }
              },
            ),
          ),
        ),
      );
}
