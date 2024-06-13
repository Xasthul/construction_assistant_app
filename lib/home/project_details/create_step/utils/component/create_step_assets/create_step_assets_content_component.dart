import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/create_step/store/create_step_store.dart';
import 'package:construction_assistant_app/home/utils/component/header_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateStepAssetsContentComponent extends StatefulWidget {
  const CreateStepAssetsContentComponent({super.key});

  @override
  State<CreateStepAssetsContentComponent> createState() => _CreateStepAssetsContentComponentState();
}

class _CreateStepAssetsContentComponentState extends State<CreateStepAssetsContentComponent> {
  final CreateStepStore _store = getIt<CreateStepStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(children: [
          const SizedBox(height: 20),
          HeaderComponent(
            title: AppLocalizations.of(context).createStepAssetsCountLabel(_store.addedAssetsCount),
            buttonTitle: AppLocalizations.of(context).createStepAddNewAssetButton,
            onPressed: _store.canAddMoreAssets ? _store.addAsset : null,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: _store.addedAssetsCount,
              itemBuilder: (context, index) => Image.memory(
                _store.assets[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ),
          const SizedBox(height: 16),
        ]),
      );
}
