import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/bottom_bar/base_bottom_bar.dart';
class AddNoteBottomNavBar extends StatelessWidget {
  const AddNoteBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteStates>(
      builder: (context, state) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            color: BlocProvider.of<AddNoteCubit>(context).note.color==Colors.transparent.value
                ? Theme.of(context).colorScheme.background
                : Color(BlocProvider.of<AddNoteCubit>(context).note.color),
            width: context.width,
            height: 45,
            child:const BaseBottomBar(),
          ),
        );
      },
    );
  }
}