import 'package:construction_assistant_app/app/utils/component/app_bar_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_filled_button_component.dart';
import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_component.dart';
import 'package:construction_assistant_app/app/utils/component/hide_keyboard_component.dart';
import 'package:construction_assistant_app/home/utils/navigator/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneTextFieldComponent extends StatelessWidget {
  const OneTextFieldComponent({
    super.key,
    required String appBarTitle,
    required TextEditingController controller,
    required String textFieldLabel,
    required String textFieldHint,
    required int textFieldMaxLength,
    required Function(String) onTextFieldChanged,
    required String buttonTitle,
    required bool isButtonEnabled,
    required VoidCallback onButtonPressed,
    int maxLines = 1,
    TextInputType? textInputType,
    List<TextInputFormatter>? inputFormatters,
  })  : _appBarTitle = appBarTitle,
        _controller = controller,
        _textFieldLabel = textFieldLabel,
        _textFieldHint = textFieldHint,
        _textFieldMaxLength = textFieldMaxLength,
        _onTextFieldChanged = onTextFieldChanged,
        _buttonTitle = buttonTitle,
        _isButtonEnabled = isButtonEnabled,
        _onButtonPressed = onButtonPressed,
        _maxLines = maxLines,
        _textInputType = textInputType,
        _inputFormatters = inputFormatters;

  final String _appBarTitle;
  final TextEditingController _controller;
  final String _textFieldLabel;
  final String _textFieldHint;
  final int _textFieldMaxLength;
  final Function(String) _onTextFieldChanged;
  final String _buttonTitle;
  final bool _isButtonEnabled;
  final VoidCallback _onButtonPressed;
  final int _maxLines;
  final TextInputType? _textInputType;
  final List<TextInputFormatter>? _inputFormatters;

  @override
  Widget build(BuildContext context) => HideKeyboardComponent(
        child: Scaffold(
          appBar: AppBarComponent(
            title: _appBarTitle,
            onBackButtonPressed: HomeNavigator.of(context).pop,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 40),
                  AppTextFieldComponent(
                    title: _textFieldLabel,
                    hint: _textFieldHint,
                    controller: _controller,
                    maxLength: _textFieldMaxLength,
                    textInputAction: TextInputAction.done,
                    onChanged: _onTextFieldChanged,
                    maxLines: _maxLines,
                    textInputType: _textInputType,
                    inputFormatters: _inputFormatters,
                  ),
                  const SizedBox(height: 32),
                  AppFilledButtonComponent(
                    title: _buttonTitle,
                    onPressed: _isButtonEnabled ? _onButtonPressed : null,
                  ),
                  const SizedBox(height: 16),
                ]),
              ),
            ),
          ),
        ),
      );
}
