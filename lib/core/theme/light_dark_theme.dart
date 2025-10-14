import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_jango/core/constants/color_control/all_color.dart';
import 'package:market_jango/core/constants/color_control/theme_color_controller.dart';
import 'package:market_jango/core/theme/text_theme.dart';
import 'input_decoration_theme.dart';

/// Controls current ThemeMode (System/Light/Dark). Default = Dark (similar to your GetX default true)
final themeModeProvider =
StateNotifierProvider<ThemeController, ThemeMode>((ref) {
  return ThemeController(); // ThemeMode.dark by default
});

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.dark);

  void toggle() {
    state = (state == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
  }

  void set(ThemeMode mode) => state = mode;
}

/// App Light Theme (custom, mirrors your previous color usage when "light")
final appLightThemeProvider = Provider<ThemeData>((ref) {
  const brightness = Brightness.light;
  return ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme.light(
      brightness: brightness,
      primary: AllColor.orange500,
      onPrimary: AllColor.white,
      secondary: ThemeColorController.green,
      onSecondary: AllColor.white,
      surface: ThemeColorController.grey,
      onSurface: ThemeColorController.black,
    ),
    inputDecorationTheme: inputDecorationTheme,
    useMaterial3: true,
    textTheme: textTheme,
  );
});

/// App Dark Theme (custom, mirrors your previous color usage when "dark")
final appDarkThemeProvider = Provider<ThemeData>((ref) {
  const brightness = Brightness.dark;
  return ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme.light( // keep light scheme API but with dark brightness
      brightness: brightness,
      primary: AllColor.orange500,
      onPrimary: ThemeColorController.black,
      secondary: ThemeColorController.green,
      onSecondary: ThemeColorController.black,
      surface: ThemeColorController.grey,
      onSurface: AllColor.white,
    ),
    inputDecorationTheme: inputDecorationTheme,
    useMaterial3: true,
    textTheme: textTheme,
  );
});
