import 'package:flutter/material.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/app/theme/constrants/input_theme.dart';

import 'constrants/text_theme.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.orange,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepOrange),
    textTheme: AppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputTheme,
  );
}
