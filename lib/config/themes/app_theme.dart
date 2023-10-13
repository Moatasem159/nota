import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:nota/core/utils/app_colors.dart';
import 'package:nota/core/utils/app_fonts.dart';
abstract class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    fontFamily: AppFonts.englishFontFamily,
    primaryColor: AppColors.whitePrimaryColor,
    colorScheme:const ColorScheme.light(background:AppColors.whiteBackgroundColor)
  );
  static final ThemeData darkTheme=ThemeData(
    fontFamily: AppFonts.englishFontFamily,
    primaryColor: AppColors.blackPrimaryColor,
    colorScheme:const ColorScheme.light(background:AppColors.blackBackgroundColor)
  );
  static const SystemUiOverlayStyle _whiteSystemUiOverlayStyle=SystemUiOverlayStyle(
    statusBarColor: AppColors.whiteBackgroundColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.whiteBackgroundColor
  );
  static const SystemUiOverlayStyle _darkSystemUiOverlayStyle=SystemUiOverlayStyle(
    statusBarColor: AppColors.blackBackgroundColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.blackBackgroundColor,
  );
  static SystemUiOverlayStyle systemUiOverlayStyle()=>
   SchedulerBinding.instance.platformDispatcher.platformBrightness==Brightness.dark?
    _darkSystemUiOverlayStyle:_whiteSystemUiOverlayStyle;
}