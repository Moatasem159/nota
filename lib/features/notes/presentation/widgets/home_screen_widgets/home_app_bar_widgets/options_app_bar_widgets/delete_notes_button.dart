import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class DeleteNotesButton extends StatelessWidget {
  const DeleteNotesButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBarCubit, AppBarStates>(
      listener: (context, state) {
        if (state is DeleteNotesSuccessState) {
          BlocProvider.of<NotesCubit>(context).getNotes();
        }
      },
      child: CustomIconButton(
          onTap:BlocProvider.of<AppBarCubit>(context).deleteNotes,
          icon: Icons.delete_forever),
    );
  }
}
