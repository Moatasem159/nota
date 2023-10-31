import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/widgets/main_drawer_widgets/drawer_builder.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle().copyWith(
        systemNavigationBarColor:Theme.of(context).colorScheme.background
      ),
      child: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: const DrawerBuilder(),
      ),
    );
  }
}