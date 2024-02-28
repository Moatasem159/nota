import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/empty_body.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
class ArchivedNotesListView extends StatelessWidget {
  const ArchivedNotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchivedNotesCubit, ArchivedNotesStates>(
      builder: (context, state) {
        if (BlocProvider.of<ArchivedNotesCubit>(context).archivedNotes.isNotEmpty) {
          return ListView.builder(
              itemCount: BlocProvider.of<ArchivedNotesCubit>(context).archivedNotes.length,
              itemBuilder: (context, index) => NoteWidget(
                  isGrid: false,
                  note: BlocProvider.of<ArchivedNotesCubit>(context).archivedNotes[index]));
        }
        return const EmptyBody(title: AppStrings.archiveBodyTitle,icon: Icons.archive_outlined);
      },
    );
  }
}