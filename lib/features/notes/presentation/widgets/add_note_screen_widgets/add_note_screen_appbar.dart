import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class AddNoteScreenAppbar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback arrowBack;
  const AddNoteScreenAppbar({super.key, required this.arrowBack});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: CustomIconButton(onTap:arrowBack, icon: Icons.arrow_back_outlined),
      actions: [
        CustomIconButton(
          onTap: () {},
          icon:MdiIcons.pin,
          tooltip: AppStrings.pin,
        ),
        CustomIconButton(
          onTap: () {},
          icon:MdiIcons.bellPlusOutline,
          tooltip: AppStrings.reminder,
        ),
        CustomIconButton(
          onTap: () {},
          icon:Icons.archive_outlined,
          tooltip: AppStrings.archive,
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}