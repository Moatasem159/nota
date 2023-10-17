import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/colors_bottom_sheet/colors_bottom_sheet.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class AddNoteBottomNavBar extends StatelessWidget {
  const AddNoteBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            color: BlocProvider.of<AddNoteCubit>(context).color==Colors.transparent.value
                ? Theme.of(context).colorScheme.background
                : Color(BlocProvider.of<AddNoteCubit>(context).color),
            width: context.width,
            height: 40,
            child: Row(
              children: [
                CustomIconButton(onTap: () {}, icon: Icons.add_box_outlined),
                CustomIconButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return BlocProvider<AddNoteCubit>.value(
                          value: BlocProvider.of<AddNoteCubit>(context),
                          child: const ColorsBottomSheet(),
                        );
                      },
                    );
                  },
                  icon: Icons.color_lens_outlined,
                ),
                CustomIconButton(onTap: () {}, icon: Icons.text_format, iconSize: 28),
                const Spacer(),
                CustomIconButton(onTap: () {}, icon: Icons.more_vert_rounded),
              ],
            ),
          ),
        );
      },
    );
  }
}