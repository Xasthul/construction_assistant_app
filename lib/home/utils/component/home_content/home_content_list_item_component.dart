import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/home_color_theme.dart';
import 'package:flutter/material.dart';

class HomeContentListItemComponent extends StatelessWidget {
  const HomeContentListItemComponent({
    super.key,
    required String projectName,
    required VoidCallback onPressed,
  })  : _projectName = projectName,
        _onPressed = onPressed;

  final String _projectName;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) => FilledButton(
        onPressed: _onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            HomeColorTheme.of(context).projectListItemBackgroundColor,
          ),
          textStyle: WidgetStateProperty.all(
            AppTextTheme.of(context).body2Medium,
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12),
          ),
          fixedSize: WidgetStateProperty.all(
            const Size.fromHeight(52),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          overlayColor: WidgetStateProperty.all(
            HomeColorTheme.of(context).projectListItemPressedColor,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Text(
              _projectName,
              style: TextStyle(
                color: CommonColorTheme.of(context).titleTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: HomeColorTheme.of(context).projectListItemIconColor,
            ),
          ),
        ]),
      );
}
