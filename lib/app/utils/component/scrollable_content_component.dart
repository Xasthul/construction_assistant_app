import 'package:construction_assistant_app/app/utils/component/no_overscroll_behavior.dart';
import 'package:construction_assistant_app/app/utils/theme/app_text_theme.dart';
import 'package:construction_assistant_app/app/utils/theme/common_color_theme.dart';
import 'package:flutter/material.dart';

class ScrollableContentComponent extends StatelessWidget {
  const ScrollableContentComponent({
    super.key,
    required Widget child,
    String? appBarTitle,
    String? staticAppBarTitle,
    Widget? leading,
    Color? appBarBackgroundColor,
    List<Widget>? actions,
  })  : _child = child,
        _appBarTitle = appBarTitle,
        _staticAppBarTitle = staticAppBarTitle,
        _leading = leading,
        _appBarBackgroundColor = appBarBackgroundColor,
        _actions = actions;

  final Widget _child;
  final String? _appBarTitle;
  final String? _staticAppBarTitle;
  final Widget? _leading;
  final Color? _appBarBackgroundColor;
  final List<Widget>? _actions;

  @override
  Widget build(BuildContext context) => CustomScrollView(scrollBehavior: NoOverScrollBehavior(), slivers: [
        if (_appBarTitle != null)
          SliverAppBar.medium(
            title: Text(
              _appBarTitle,
              style: AppTextTheme.of(context).largeTitleBold.copyWith(
                    color: CommonColorTheme.of(context).titleTextColor,
                  ),
            ),
          ),
        if (_staticAppBarTitle != null && _leading != null)
          SliverAppBar(
            title: Text(
              _staticAppBarTitle,
              style: AppTextTheme.of(context).headline1Bold.copyWith(
                    color: CommonColorTheme.of(context).titleTextColor,
                  ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: _appBarBackgroundColor,
            surfaceTintColor: _appBarBackgroundColor,
            leading: _leading,
            actions: _actions,
          ),
        SliverToBoxAdapter(child: _child),
      ]);
}
