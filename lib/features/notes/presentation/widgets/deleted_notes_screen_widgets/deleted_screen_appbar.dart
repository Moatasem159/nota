import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class DeletedScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DeletedScreenAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      titleSpacing: 0,
      title: Text(AppStrings.deleted,style:Theme.of(context).textTheme.titleMedium),
      actions: [
        CustomIconButton(onTap: () {}, icon: Icons.delete_forever),
      ],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}