import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/options_app_bar.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/search_app_bar.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: BlocProvider.of<AppBarCubit>(context).isBase
              ? const SearchAppBar()
              : const OptionsAppBar(),
        );
      },
    );
  }
  @override
  Size get preferredSize => Size(
      double.infinity,
      PlatformDispatcher.instance.views.first.physicalSize.height /
          16.35555555555556);
}