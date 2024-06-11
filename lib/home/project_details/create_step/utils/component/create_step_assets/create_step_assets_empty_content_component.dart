import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/home/project_details/create_step/store/create_step_store.dart';
import 'package:construction_assistant_app/home/utils/component/empty_content_component.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class CreateStepAssetsEmptyContentComponent extends StatefulWidget {
  const CreateStepAssetsEmptyContentComponent({super.key});

  @override
  State<CreateStepAssetsEmptyContentComponent> createState() => _CreateStepAssetsEmptyContentComponentState();
}

class _CreateStepAssetsEmptyContentComponentState extends State<CreateStepAssetsEmptyContentComponent> {
  final CreateStepStore _store = getIt<CreateStepStore>();

  @override
  Widget build(BuildContext context) => EmptyContentComponent(
        title: AppLocalizations.of(context).createStepNoAssetsYetLabel,
        description: AppLocalizations.of(context).createStepAddTheFirstAssetForThisStepLabel,
        buttonTitle: AppLocalizations.of(context).createStepAddAssetButton,
        onPressed: _store.addAsset,
      );
}
