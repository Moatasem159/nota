import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class AddNoteScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback arrowBack;
  const AddNoteScreenAppbar({super.key, required this.arrowBack});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: BlocProvider.of<AddNoteCubit>(context).color == Colors.transparent.value
              ? Theme.of(context).colorScheme.background
              : Color(BlocProvider.of<AddNoteCubit>(context).color),
          leading: CustomIconButton(onTap: arrowBack, icon: Icons.arrow_back_outlined),
          actions: [
            CustomIconButton(
              onTap: () {},
              icon: Icons.push_pin_rounded,
              tooltip: AppStrings.pin,
            ),
            CustomIconButton(
              onTap: () {},
              icon: Icons.notification_add_outlined,
              tooltip: AppStrings.reminder,
            ),
            CustomIconButton(
              onTap: () {},
              icon: Icons.archive_outlined,
              tooltip: AppStrings.archive,
            ),
          ],
        );
      },
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
