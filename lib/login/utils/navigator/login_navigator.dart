import 'package:construction_assistant_app/login/create_account/create_account_component.dart';
import 'package:flutter/material.dart';

class LoginNavigator extends InheritedWidget {
  factory LoginNavigator({required Widget child}) {
    final navigationKey = GlobalKey<NavigatorState>();
    return LoginNavigator._(
      navigationKey: navigationKey,
      child: NavigatorPopHandler(
        onPop: () => navigationKey.currentState!.maybePop(),
        child: Navigator(
          key: navigationKey,
          onGenerateRoute: (_) => MaterialPageRoute(
            builder: (_) => child,
          ),
        ),
      ),
    );
  }

  const LoginNavigator._({
    required super.child,
    required GlobalKey<NavigatorState> navigationKey,
  }) : _navigationKey = navigationKey;
  final GlobalKey<NavigatorState> _navigationKey;

  static LoginNavigator of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<LoginNavigator>()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => this != oldWidget;

  void pop() => _navigationKey.currentState?.pop();

  void maybePop() => _navigationKey.currentState?.maybePop();

  void popUntilFirst() => _navigationKey.currentState?.popUntil((route) => route.isFirst);

  void navigateToCreateAccountComponent() => _navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => const CreateAccountComponent(),
        ),
      );
}
