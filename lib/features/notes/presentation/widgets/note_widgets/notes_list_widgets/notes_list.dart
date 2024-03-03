import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/change_list_view_cubit/change_list_view_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list/notes_grid_list.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_normal_list.dart';
class NotesList extends StatelessWidget {
  final bool inArchivedScreen;
  const NotesList({super.key, required this.inArchivedScreen});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeListViewCubit,bool>(
      builder: (context, state) {
        if (state) {
          return NotesGridList(inArchivedScreen: inArchivedScreen,);
        } else {
          return NotesNormalList(inArchivedScreen: inArchivedScreen,);
        }
      },
    );
  }
}