import 'package:flutter/material.dart';

abstract final class Palette {
  static const background = Color(0xFF0C1020);
  static const surface = Color(0xFF1B2339);
  static const violet = Color(0xFFC3BBF4);
  static const gold = Color(0xFFDFD2B5);
  static const mint = Color(0xFFA5DAD6);
  static const ink = Color(0xFFF3F4FC);
  static const muted = Color(0xFFB9C2D7);
  static const glass = Color(0xB31C253E);
  static const edge = Color(0x38E3E9FF);
}

ThemeData buildTheme() => ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
  colorScheme: const ColorScheme.dark(
    primary: Palette.violet,
    onPrimary: Palette.background,
    secondary: Palette.mint,
    surface: Palette.surface,
    onSurface: Palette.ink,
    onSurfaceVariant: Palette.muted,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    foregroundColor: Palette.ink,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: -.6,
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    indicatorColor: Palette.violet.withValues(alpha: .2),
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) => TextStyle(
        fontSize: 11,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w700
            : FontWeight.w400,
        color: states.contains(WidgetState.selected)
            ? Palette.ink
            : Palette.muted,
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Palette.ink,
      backgroundColor: Colors.white.withValues(alpha: .05),
      side: const BorderSide(color: Palette.edge),
      minimumSize: const Size(44, 44),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Palette.glass,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(color: Palette.edge),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(color: Palette.edge),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(color: Palette.violet, width: 1.5),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white.withValues(alpha: .06),
    side: const BorderSide(color: Palette.edge),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    labelStyle: const TextStyle(color: Palette.ink),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Palette.ink,
      minimumSize: const Size(48, 48),
      backgroundColor: Colors.white.withValues(alpha: .04),
      side: const BorderSide(color: Palette.edge),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Palette.violet,
      foregroundColor: Palette.background,
      minimumSize: const Size(48, 54),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  ),
);
