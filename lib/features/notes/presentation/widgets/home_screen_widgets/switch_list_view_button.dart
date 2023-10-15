import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class SwitchListViewButton extends StatelessWidget {
  const SwitchListViewButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return CustomIconButton(
            icon: BlocProvider.of<NotesCubit>(context).isGrid
                ? Icons.grid_view_rounded
                : Icons.view_agenda_outlined,
            onTap: BlocProvider.of<NotesCubit>(context).changeView);
      },
    );
  }
}