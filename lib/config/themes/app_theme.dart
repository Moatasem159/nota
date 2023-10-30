import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:nota/core/utils/app_colors.dart';
import 'package:nota/core/utils/app_fonts.dart';
abstract class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    fontFamily: AppFonts.englishFontFamily,
    primaryColor: AppColors.whitePrimaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.whiteBackgroundColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color:Colors.black
      ),
      bodyMedium: TextStyle(
          color:Colors.black
      ),
      bodySmall: TextStyle(
          color:Colors.black
      ),
      displayLarge:TextStyle(
          color:Colors.black
      ),
      displayMedium: TextStyle(
          color:Colors.black
      ),
      displaySmall: TextStyle(
          color:Colors.black
      ),
      headlineLarge: TextStyle(
          color:Colors.black
      ),
      headlineMedium: TextStyle(
          color:Colors.black
      ),
      headlineSmall: TextStyle(
          color:Colors.black
      ),
      labelLarge: TextStyle(
          color:Colors.black
      ),
      labelMedium: TextStyle(
          color:Colors.black
      ),
      labelSmall: TextStyle(
          color:Colors.black
      ),
      titleLarge: TextStyle(
          color:Colors.black
      ),
      titleMedium: TextStyle(
          color:Colors.black
      ),
      titleSmall: TextStyle(
          color:Colors.black
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColors.whiteSecondaryColor),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteSecondaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
  ),
    colorScheme: ColorScheme.light(
        background: AppColors.whiteBackgroundColor,
        secondary: AppColors.whiteBackgroundColor.withOpacity(0.9),
      ),
    tooltipTheme:  TooltipThemeData(
      textStyle: const TextStyle(fontFamily: AppFonts.englishFontFamily,color: Colors.white),
      decoration: BoxDecoration(
        color: AppColors.blackBackgroundColor,
          borderRadius: BorderRadius.circular(7)
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
      )
  );
  static final ThemeData darkTheme=ThemeData(
    fontFamily: AppFonts.englishFontFamily,
    primaryColor: AppColors.blackPrimaryColor,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.blackBackgroundColor,
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color:Colors.white
        ),
        bodyMedium: TextStyle(
            color:Colors.white
        ),
        bodySmall: TextStyle(
            color:Colors.white
        ),
        displayLarge:TextStyle(
            color:Colors.white
        ),
        displayMedium: TextStyle(
            color:Colors.white
        ),
        displaySmall: TextStyle(
            color:Colors.white
        ),
        headlineLarge: TextStyle(
            color:Colors.white
        ),
        headlineMedium: TextStyle(
            color:Colors.white
        ),
        headlineSmall: TextStyle(
            color:Colors.white
        ),
        labelLarge: TextStyle(
            color:Colors.white
        ),
        labelMedium: TextStyle(
            color:Colors.white
        ),
        labelSmall: TextStyle(
            color:Colors.white
        ),
        titleLarge: TextStyle(
            color:Colors.white
        ),
        titleMedium: TextStyle(
            color:Colors.white
        ),
        titleSmall: TextStyle(
            color:Colors.white
        ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: AppColors.blackSecondaryColor),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.blackSecondaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
    colorScheme: ColorScheme.light(
          background: AppColors.blackBackgroundColor,
          secondary: AppColors.blackBackgroundColor.withOpacity(0.9),),
    tooltipTheme:  TooltipThemeData(
        textStyle: const TextStyle(fontFamily: AppFonts.englishFontFamily,color: Colors.black),
        decoration: BoxDecoration(
          color: AppColors.whiteBackgroundColor,
          borderRadius: BorderRadius.circular(7)
        ),),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 22
      )
    )
  );
  static SystemUiOverlayStyle systemUiOverlayStyle()=>
   SchedulerBinding.instance.platformDispatcher.platformBrightness==Brightness.dark?
    _darkSystemUiOverlayStyle:_whiteSystemUiOverlayStyle;
  static const SystemUiOverlayStyle _whiteSystemUiOverlayStyle=SystemUiOverlayStyle(
      statusBarColor: AppColors.whiteBackgroundColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.whiteSecondaryColor
  );
  static const SystemUiOverlayStyle _darkSystemUiOverlayStyle=SystemUiOverlayStyle(
    statusBarColor: AppColors.blackBackgroundColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.blackSecondaryColor,
  );
}