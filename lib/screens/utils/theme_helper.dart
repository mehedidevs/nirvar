import 'package:flutter/material.dart';

extension ThemeExtensions on BuildContext {
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
