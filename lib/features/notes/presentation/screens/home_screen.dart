import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/widgets/bottom_navigation_bar_widgets/custom_bottom_nav_bar.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle(),
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: const HomeScreenBody(),
          backgroundColor: Theme.of(context).colorScheme.background,
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }
}