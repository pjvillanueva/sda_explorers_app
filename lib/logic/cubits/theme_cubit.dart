import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sda_explorers_app/presentation/theme/app_theme.dart'; // adjust path as needed

class ThemeState {
  ThemeState({required this.themeMode, required this.themeData});

  ThemeMode themeMode;
  ThemeData themeData;

  Map<String, dynamic> toJson() => {
        'themeMode': themeMode.name,
      };

  ThemeState.fromJson(Map<String, dynamic> json)
      : themeMode =
            ThemeMode.values.firstWhere((e) => e.name == json['themeMode']),
        themeData = json['themeMode'] == 'dark'
            ? AppTheme.darkTheme
            : AppTheme.lightTheme;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  String toString() => 'theme: $themeMode';
}

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeMode: initialTheme,
            themeData: initialTheme == ThemeMode.dark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
          ),
        );

  void toggleTheme() {
    final newThemeMode =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(
      ThemeState(
        themeMode: newThemeMode,
        themeData: newThemeMode == ThemeMode.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
      ),
    );
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return state.toJson();
  }
}

// Initial theme based on system brightness
ThemeMode get initialTheme {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  if (brightness == Brightness.dark) {
    return ThemeMode.dark;
  }
  return ThemeMode.light;
}
