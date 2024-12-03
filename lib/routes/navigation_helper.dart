import 'package:flutter/material.dart';


extension AppRoutesExtension on BuildContext {
  /// Navigate to the specified route.
  void pushNamed({required String routeName, Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Replace the current route with the specified one.
  void pushReplacementNamed({required String routeName, Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pop the current route.
  void pop([Object? result]) {
    Navigator.of(this).pop(result);
  }

  /// Clear the entire stack and navigate to a new route.
  void pushNamedAndRemoveUntil({required String routeName, Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }
}
