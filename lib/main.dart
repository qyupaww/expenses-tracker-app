import 'package:flutter/material.dart';

import 'widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 177, 159),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 97, 87),
  brightness: Brightness.dark,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kDarkColorScheme.onPrimaryContainer,
        foregroundColor: kDarkColorScheme.primaryContainer,
      ),
      cardTheme: const CardThemeData().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      cardTheme: const CardThemeData().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
