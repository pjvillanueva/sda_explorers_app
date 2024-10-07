import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppTheme {
  const AppTheme._();
  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF001F3F),
        secondary: Colors.cyan,
        surface: const Color.fromARGB(255, 0, 42, 83),
        error: Colors.red.shade800,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        onError: Colors.white,
      ));
  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.light(
        primary: const Color.fromARGB(255, 166, 199, 231),
        secondary: Colors.cyan.shade700,
        // surface: const Color.fromARGB(255, 86, 146, 207),
        surface: Colors.white,
        error: Colors.red.shade800,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onError: Colors.white,
      ));

  static Brightness get currentSystemBrightness {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }
}
