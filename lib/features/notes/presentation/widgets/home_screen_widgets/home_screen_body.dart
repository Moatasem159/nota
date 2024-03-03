import 'package:flutter/material.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_list.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const NotesList(inArchivedScreen: false);
  }
}