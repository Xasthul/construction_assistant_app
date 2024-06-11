import 'package:flutter/services.dart';

class CreateStepOrderInputFormatter extends TextInputFormatter {
  static final RegExp _onlyDigitsRegExp = RegExp(r'\d*');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String matchingNewValue = _onlyDigitsRegExp.stringMatch(newValue.text) ?? '';
    return matchingNewValue == newValue.text ? newValue : oldValue;
  }
}
