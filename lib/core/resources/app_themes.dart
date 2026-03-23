import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
    colorSchemeSeed: AppColors.blue,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      color: AppColors.paleIceBlue,
      centerTitle: true,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.lightBeige
    ),
    useMaterial3: true,
    fontFamily: 'SchibstedGrotesk',
  );
}