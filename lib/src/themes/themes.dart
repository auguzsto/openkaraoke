import 'package:flutter/material.dart';

ThemeData get themeDefault => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.grey,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.grey.shade800,
        onBackground: Colors.grey,
        surface: Colors.white,
        onSurface: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(21),
        hintStyle: TextStyle(fontSize: 35),
        filled: true,
        fillColor: Colors.black,
      ),
    );
