import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/empty_body.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list/custom_grid_list.dart';
class ArchivedNotesGirdViewList extends StatelessWidget {
  const ArchivedNotesGirdViewList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchivedNotesCubit, ArchivedNotesStates>(
      builder: (context, state) {
        if (BlocProvider.of<ArchivedNotesCubit>(context).archivedNotes.isNotEmpty) {
          return CustomGridList(inArchivedScreen: true,notes: BlocProvider.of<ArchivedNotesCubit>(context).archivedNotes, padding: 15);
        }
        return const EmptyBody(
            title: AppStrings.archiveBodyTitle,
            icon: Icons.archive_outlined);
      },
    );
  }
}