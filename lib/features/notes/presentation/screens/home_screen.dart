import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/widgets/custom_drawer_widgets/main_drawer.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/add_note_button_widgets/add_note_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_screen_body.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/home_app_bar.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      buildWhen: (previous, current) => current != previous,
      builder: (_,__) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppTheme.systemUiOverlayStyle().copyWith(
            statusBarColor: !BlocProvider.of<AppBarCubit>(context).isBase
                ? Theme.of(context).appBarTheme.backgroundColor
                : null,
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor:Theme.of(context).colorScheme.background,
              appBar: const HomeAppBar(),
              drawer: const CustomDrawer(),
              body: const HomeScreenBody(),
              // bottomNavigationBar: const CustomBottomNavBar(),
              floatingActionButton: const AddNoteButton(),
            ),
          ),
        );
      },
    );
  }
}
