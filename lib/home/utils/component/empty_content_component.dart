import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class EmptyContentComponent extends StatelessWidget {
  const EmptyContentComponent({
    super.key,
    required String title,
    required String description,
    required String buttonTitle,
    required VoidCallback onPressed,
  })  : _title = title,
        _description = description,
        _buttonTitle = buttonTitle,
        _onPressed = onPressed;

  final String _title;
  final String _description;
  final String _buttonTitle;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(children: [
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                _title,
                style: AppTextTheme.of(context).largeTitleBold.copyWith(
                      color: CommonColorTheme.of(context).titleTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _description,
                style: AppTextTheme.of(context).body2Medium.copyWith(
                      color: CommonColorTheme.of(context).labelTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          const SizedBox(height: 8),
          AppFilledButtonComponent(
            title: _buttonTitle,
            onPressed: _onPressed,
          ),
          const SizedBox(height: 16),
        ]),
      );
}
