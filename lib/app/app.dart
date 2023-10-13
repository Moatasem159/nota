import 'package:flutter/material.dart';
import 'package:nota/config/routes/app_routes.dart';
import 'package:nota/config/themes/app_theme.dart';
class Nota extends StatelessWidget {
  const Nota({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner:false,
      theme:AppTheme.lightTheme,
      darkTheme:AppTheme.darkTheme,
    );
  }
}