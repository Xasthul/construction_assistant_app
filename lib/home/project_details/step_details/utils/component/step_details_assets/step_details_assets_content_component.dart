import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/home/project_details/step_details/store/step_details_store.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StepDetailsAssetsContentComponent extends StatefulWidget {
  const StepDetailsAssetsContentComponent({super.key});

  @override
  State<StepDetailsAssetsContentComponent> createState() => _StepDetailsAssetsContentComponentState();
}

class _StepDetailsAssetsContentComponentState extends State<StepDetailsAssetsContentComponent> {
  final StepDetailsStore _store = getIt<StepDetailsStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context).stepDetailsAssetsCountLabel(_store.assetsCount),
              style: AppTextTheme.of(context).body2Bold.copyWith(
                    color: CommonColorTheme.of(context).titleTextColor,
                  ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: _store.assetsCount,
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
