import 'package:knowunity_flutter/navigation/app_navigator.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  void close() => appNavigator.close();
}
