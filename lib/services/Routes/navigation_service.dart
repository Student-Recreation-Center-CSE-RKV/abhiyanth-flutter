import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> removeAllAndPush(
      String routeName, {
        dynamic arguments,
      }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
          (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pushDialog(Widget dialog) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void pop() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      return navigatorKey.currentState!.pop();
    }
  }

  // void printNavigatorState() {
  //   final navigatorState = navigatorKey.currentState;
  //   if (navigatorState != null) {
  //     print('Can pop: ${navigatorState.canPop()}');
  //     print('Current Route: ${navigatorState.widget}');
  //     print('Navigator Stack: ${navigatorState.widget}');
  //     print(
  //       'Route History: ${navigatorState.widget.pages.map((page) => page.toString()).toList()}',
  //     );
  //   }
  // }
}
