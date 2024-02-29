import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: white,
  brightness: Brightness.light,
  primaryColor: purple2,
  indicatorColor: purple2,
  dividerColor: white.withOpacity(0.3),
  hintColor: white.withOpacity(0.3),
  scrollbarTheme: const ScrollbarThemeData().copyWith(thumbColor: MaterialStateProperty.all(white)),
  fontFamily: "Roboto",
  colorScheme: ColorScheme.fromSeed(
    seedColor: purple2,
    background: white,
    onBackground: grey11,
    brightness: Brightness.light,
    primary: purple2,
    error: red,
    onPrimary: white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: transparent,
    elevation: 0,
    foregroundColor: white,
    centerTitle: true
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: purple2,
    elevation: 0,
    selectedItemColor: white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: purple2, foregroundColor: white,),
);
