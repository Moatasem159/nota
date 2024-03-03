import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list/notes_sliver_grid_list.dart';
class NotesGridList extends StatelessWidget {
  final bool inArchivedScreen;
  const NotesGridList({super.key, required this.inArchivedScreen});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if(BlocProvider.of<NotesCubit>(context).pinnedNotes.isNotEmpty)
            NotesSliverGridList(
              padding: 80,
              inArchivedScreen: inArchivedScreen,
              title: AppStrings.pinned,
              notes: BlocProvider.of<NotesCubit>(context).pinnedNotes,
            ),
            if(BlocProvider.of<NotesCubit>(context).notes.isNotEmpty)
            NotesSliverGridList(
                padding: 15,
                inArchivedScreen: inArchivedScreen,
                showTitle: BlocProvider.of<NotesCubit>(context).pinnedNotes.isNotEmpty,
                title:AppStrings.others,
                notes: BlocProvider.of<NotesCubit>(context).notes,
              ),
          ],
        );
      },
    );
  }
}