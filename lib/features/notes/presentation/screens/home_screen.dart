import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/change_list_view_cubit/change_list_view_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/custom_bottom_nav_bar.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_screen_body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeListViewCubit(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(),
        child: SafeArea(
          child: Scaffold(
            extendBody: true,
            body: const HomeScreenBody(),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottomNavigationBar: const CustomBottomNavBar(),
          ),
        ),
      ),
    );
  }
}