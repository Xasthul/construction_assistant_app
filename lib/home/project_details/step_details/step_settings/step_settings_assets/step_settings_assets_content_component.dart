import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/home/utils/component/header_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepSettingsAssetsContentComponent extends StatefulWidget {
  const StepSettingsAssetsContentComponent({super.key});

  @override
  State<StepSettingsAssetsContentComponent> createState() => _StepSettingsAssetsContentComponentState();
}

class _StepSettingsAssetsContentComponentState extends State<StepSettingsAssetsContentComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(children: [
          const SizedBox(height: 20),
          HeaderComponent(
            title: AppLocalizations.of(context).stepSettingsAssetsCountLabel(_store.updateAssetsCount),
            buttonTitle: AppLocalizations.of(context).stepSettingsAddNewAssetButton,
            onPressed: _store.canAddMoreAssets ? _store.addAsset : null,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: _store.updateAssetsCount + 1,
              itemBuilder: (context, index) {
                if (index == _store.updateAssetsCount) {
                  return AppFilledButtonComponent(
                    title: AppLocalizations.of(context).stepSettingsSaveButton,
                    // TODO(naz): make button disabled
                    // onPressed: _store.isSaveAssetsButtonEnabled ? _store.updateStepAssets : null,
                    onPressed: _store.updateStepAssets,
                  );
                }
                return GestureDetector(
                  onLongPress: () => _store.deleteAsset(index),
                  child: Image.memory(_store.updateAssets[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ),
          const SizedBox(height: 16),
        ]),
      );
}
