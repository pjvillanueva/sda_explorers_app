import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sda_explorers_app/presentation/theme/app_colors.dart';
import 'package:sda_explorers_app/presentation/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme._();

  static final darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: DARK_PRIMARY_COLOR,
      prefixIconColor: DARK_PRIMARY_COLOR,
      suffixIconColor: COLOR_GREY,
      fillColor: COLOR_GREY,
      focusColor: DARK_PRIMARY_COLOR,
    ),
    colorScheme: const ColorScheme.dark(
        primary: DARK_PRIMARY_COLOR,
        secondary: DARK_SECONDARY_COLOR,
        surface: DARK_SURFACE_COLOR,
        background: DARK_BACKGROUND_COLOR,
        error: DARK_ERROR_COLOR,
        onPrimary: COLOR_WHITE,
        onSecondary: COLOR_WHITE,
        onSurface: COLOR_WHITE,
        onBackground: COLOR_WHITE),
    primarySwatch: Colors.blue,
    primaryColor: DARK_PRIMARY_COLOR,
    focusColor: DARK_PRIMARY_COLOR,
    scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
    // bottomAppBarColor: DARK_SURFACE_COLOR,
    cardColor: DARK_SURFACE_COLOR,
    dividerColor: COLOR_GREY,
    highlightColor: DARK_PRIMARY_COLOR,
    splashColor: COLOR_GREY,
    unselectedWidgetColor: COLOR_GREY,
    disabledColor: COLOR_GREY,
    // backgroundColor: DARK_BACKGROUND_COLOR,
    dialogBackgroundColor: DARK_SURFACE_COLOR,
    indicatorColor: DARK_SECONDARY_COLOR,
    hintColor: COLOR_GREY,
    // errorColor: DARK_ERROR_COLOR,
    // toggleableActiveColor: DARK_SURFACE_COLOR,
    fontFamily: kfontFamily,
  );

  static final lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: LIGHT_PRIMARY_COLOR,
      prefixIconColor: LIGHT_PRIMARY_COLOR,
      suffixIconColor: COLOR_GREY,
      fillColor: COLOR_GREY,
      focusColor: LIGHT_PRIMARY_COLOR,
    ),
    colorScheme: const ColorScheme.light(
        primary: LIGHT_PRIMARY_COLOR,
        secondary: LIGHT_SECONDARY_COLOR,
        surface: LIGHT_SURFACE_COLOR,
        background: LIGHT_BACKGROUND_COLOR,
        error: LIGHT_ERROR_COLOR,
        onPrimary: COLOR_WHITE,
        onSecondary: COLOR_WHITE,
        onSurface: COLOR_WHITE,
        onBackground: COLOR_WHITE),
    primarySwatch: Colors.blue,
    primaryColor: LIGHT_PRIMARY_COLOR,
    focusColor: LIGHT_PRIMARY_COLOR,
    scaffoldBackgroundColor: LIGHT_BACKGROUND_COLOR,
    // bottomAppBarColor: LIGHT_SURFACE_COLOR,
    cardColor: LIGHT_SURFACE_COLOR,
    dividerColor: COLOR_GREY,
    highlightColor: LIGHT_PRIMARY_COLOR,
    splashColor: COLOR_GREY,
    unselectedWidgetColor: COLOR_GREY,
    disabledColor: COLOR_GREY,
    // backgroundColor: LIGHT_BACKGROUND_COLOR,
    dialogBackgroundColor: LIGHT_SURFACE_COLOR,
    indicatorColor: LIGHT_SECONDARY_COLOR,
    hintColor: COLOR_GREY,
    // errorColor: LIGHT_ERROR_COLOR,
    // toggleableActiveColor: LIGHT_SURFACE_COLOR,
    fontFamily: kfontFamily,
  );

  static Brightness get currentSystemBrightness {
    return SchedulerBinding.instance.window.platformBrightness;
  }

  static double get currentScreenWidth {
    var data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.width;
  }

  static final kdisplayLargeTesting = TextStyle(
      color: Colors.red,
      fontSize: 57.0.sm,
      fontWeight: regular,
      height: 64.0.h,
      letterSpacing: 0.w);
}
