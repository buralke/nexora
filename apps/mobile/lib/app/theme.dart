import 'package:flutter/material.dart';

abstract final class Palette {
  static const background = Color(0xFF15151F);
  static const surface = Color(0xFF211E30);
  static const violet = Color(0xFFB7A1F4);
  static const gold = Color(0xFFE3C58E);
  static const ink = Color(0xFFF5F2EC);
  static const muted = Color(0xFFBAB4C8);
}

ThemeData buildTheme() => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Palette.background,
  colorScheme: const ColorScheme.dark(
    primary: Palette.violet,
    secondary: Palette.gold,
    surface: Palette.surface,
    onSurface: Palette.ink,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Palette.background,
    foregroundColor: Palette.ink,
    centerTitle: false,
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Palette.surface,
    indicatorColor: Color(0xFF44365D),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Palette.surface,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(48, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
);
