import 'package:flutter/material.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/list_title.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list/custom_grid_list.dart';
class NotesSliverGridList extends StatelessWidget {
  final String title;
  final int padding;
  final List<Note> notes;
  final bool showTitle;
  final bool inArchivedScreen;
  const NotesSliverGridList({super.key, required this.title, required this.padding, required this.notes,this.showTitle=true, required this.inArchivedScreen,});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(showTitle)
          ListTitle(title:title),
          10.ph,
          CustomGridList(inArchivedScreen:inArchivedScreen,notes: notes,padding: padding),
        ],
      ),
    );
  }
}