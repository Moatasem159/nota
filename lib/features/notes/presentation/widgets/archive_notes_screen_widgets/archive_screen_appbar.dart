import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/switch_list_view_button.dart';
class ArchiveScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArchiveScreenAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      titleSpacing: 0,
      title: Text(AppStrings.archive,style:Theme.of(context).textTheme.titleMedium),
      actions: [
        CustomIconButton(onTap: () {}, icon: Icons.search),
        const SwitchListViewButton()
      ],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
