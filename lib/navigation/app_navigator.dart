import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'AppNavigator Key');

  Future<R?> push<R>(Widget page) => Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  pushReplacement(Widget page) => Navigator.of(navigatorKey.currentState!.context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );

  close() => Navigator.of(navigatorKey.currentState!.context).pop();

  void closeWithResult<T>(
    T result, {
    BuildContext? context,
  }) =>
      Navigator.of(navigatorKey.currentState!.context).pop(result);
}
