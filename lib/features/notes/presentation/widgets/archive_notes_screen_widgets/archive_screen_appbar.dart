import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/options_app_bar.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/switch_list_view_button.dart';
class ArchiveScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArchiveScreenAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (_, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: BlocProvider.of<AppBarCubit>(context).isBase
              ? AppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  titleSpacing: 0,
                  title: Text(AppStrings.archive,
                      style: Theme.of(context).textTheme.titleMedium),
                  actions: [
                      CustomIconButton(onTap: () {}, icon: Icons.search),
                      const SwitchListViewButton()
                    ])
              : const OptionsAppBar(inArchivedScreen: true),
        );
      },
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
