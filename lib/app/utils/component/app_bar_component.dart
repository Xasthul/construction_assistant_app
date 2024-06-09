import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({
    super.key,
    required String title,
    required VoidCallback? onBackButtonPressed,
    List<Widget>? actions,
  })  : _title = title,
        _onBackButtonPressed = onBackButtonPressed,
        _actions = actions;

  final String _title;
  final VoidCallback? _onBackButtonPressed;
  final List<Widget>? _actions;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          _title,
          style: AppTextTheme.of(context).headline2Bold.copyWith(
                color: CommonColorTheme.of(context).titleTextColor,
              ),
        ),
        leading: IconButton(
          onPressed: _onBackButtonPressed,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: CommonColorTheme.of(context).appBarBackButtonColor,
          ),
        ),
        actions: _actions,
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
