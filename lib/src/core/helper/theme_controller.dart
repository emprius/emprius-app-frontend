import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lightTheme = FlexColorScheme.light(scheme: FlexScheme.verdunHemlock).toTheme;
final darkTheme = FlexColorScheme.dark(scheme: FlexScheme.verdunHemlock).toTheme;

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData>{
  ThemeNotifier() : super(lightTheme);
  void switchTheme() => state = state == lightTheme ? darkTheme : lightTheme;
}