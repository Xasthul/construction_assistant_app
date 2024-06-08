import 'package:construction_assistant_app/app/utils/component/app_text_field/app_text_field_icon_component.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_field_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldComponent extends StatelessWidget {
  const AppTextFieldComponent({
    super.key,
    required TextEditingController controller,
    required int maxLength,
    required TextInputAction textInputAction,
    String? title,
    String? hint,
    String? suffixText,
    String? errorText,
    bool? obscureText,
    String? helperText,
    String? leadingIcon,
    String? trailingIcon,
    FocusNode? focusNode,
    FocusNode? nextFocusNode,
    Function(String)? onChanged,
    VoidCallback? onLeadingIconPressed,
    VoidCallback? onTrailingIconPressed,
    bool isEmpty = false,
    TextInputType? textInputType,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatters,
    bool autofocus = false,
  })  : _controller = controller,
        _title = title,
        _maxLength = maxLength,
        _textInputAction = textInputAction,
        _hint = hint,
        _suffixText = suffixText,
        _errorText = errorText,
        _obscureText = obscureText,
        _helperText = helperText,
        _leadingIcon = leadingIcon,
        _trailingIcon = trailingIcon,
        _focusNode = focusNode,
        _nextFocusNode = nextFocusNode,
        _onChanged = onChanged,
        _onLeadingIconPressed = onLeadingIconPressed,
        _onTrailingIconPressed = onTrailingIconPressed,
        _isEmpty = isEmpty,
        _textInputType = textInputType,
        _textCapitalization = textCapitalization,
        _inputFormatters = inputFormatters,
        _autofocus = autofocus;

  final TextEditingController _controller;
  final int _maxLength;
  final TextInputAction _textInputAction;
  final String? _title;
  final String? _hint;
  final String? _suffixText;
  final String? _errorText;
  final bool? _obscureText;
  final String? _helperText;
  final String? _leadingIcon;
  final String? _trailingIcon;
  final FocusNode? _focusNode;
  final FocusNode? _nextFocusNode;
  final Function(String)? _onChanged;
  final VoidCallback? _onLeadingIconPressed;
  final VoidCallback? _onTrailingIconPressed;
  final bool _isEmpty;
  final TextInputType? _textInputType;
  final TextCapitalization? _textCapitalization;
  final List<TextInputFormatter>? _inputFormatters;
  final bool _autofocus;

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (_title != null) ...[
          Text(
            _title,
            style: AppTextTheme.of(context).captionBold.copyWith(
                  color: AppTextFieldColorTheme.of(context).titleColor,
                ),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: _controller,
          maxLength: _maxLength,
          obscureText: _obscureText ?? false,
          obscuringCharacter: '*',
          textInputAction: _textInputAction,
          focusNode: _focusNode,
          onSubmitted: (_) => _nextFocusNode != null //
              ? FocusScope.of(context).requestFocus(_nextFocusNode)
              : null,
          onChanged: _onChanged,
          onTap: ScaffoldMessenger.of(context).clearSnackBars,
          style: AppTextTheme.of(context).body1Regular.copyWith(
                color: _hasError
                    ? AppTextFieldColorTheme.of(context).errorTextColor
                    : AppTextFieldColorTheme.of(context).textColor,
              ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTextFieldColorTheme.of(context).fillColor,
            //NOTE: counterText required to hide counter from [maxLength]
            counterText: '',
            hintText: _hint,
            hintStyle: AppTextTheme.of(context).body1Regular.copyWith(
                  color: _hasError
                      ? AppTextFieldColorTheme.of(context).errorTextColor
                      : AppTextFieldColorTheme.of(context).hintTextColor,
                ),
            suffixText: _suffixText,
            suffixStyle: AppTextTheme.of(context).body1Regular.copyWith(
                  color: _hasError
                      ? AppTextFieldColorTheme.of(context).errorTextColor
                      : AppTextFieldColorTheme.of(context).suffixTextColor,
                ),
            enabledBorder: _buildBorder(context),
            focusedBorder: _buildBorder(context),
            prefixIcon: _leadingIcon != null //
                ? AppTextFieldIconComponent(
                    icon: _leadingIcon,
                    hasError: _hasError,
                    isEmpty: _isEmpty,
                    onPressed: _onLeadingIconPressed,
                  )
                : null,
            suffixIcon: _trailingIcon != null //
                ? AppTextFieldIconComponent(
                    icon: _trailingIcon,
                    hasError: _hasError,
                    isEmpty: _isEmpty,
                    onPressed: _onTrailingIconPressed,
                  )
                : null,
          ),
          keyboardType: _textInputType,
          textCapitalization: _textCapitalization ?? TextCapitalization.none,
          autocorrect: false,
          inputFormatters: _inputFormatters,
          autofocus: _autofocus,
        ),
        if (!_hasError && _helperText != null)
          Column(children: [
            const SizedBox(height: 4),
            Text(
              _helperText,
              style: AppTextTheme.of(context).captionRegular.copyWith(
                    color: AppTextFieldColorTheme.of(context).helperTextColor,
                  ),
            ),
          ]),
        if (_hasError)
          Column(children: [
            const SizedBox(height: 4),
            Text(
              _errorText!,
              style: AppTextTheme.of(context).captionRegular.copyWith(
                    color: AppTextFieldColorTheme.of(context).errorTextColor,
                  ),
            ),
          ]),
      ]);

  bool get _hasError => _errorText != null;

  OutlineInputBorder _buildBorder(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: _hasError
              ? AppTextFieldColorTheme.of(context).errorBorderColor
              : AppTextFieldColorTheme.of(context).borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      );
}
