import 'package:flutter/material.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_body/image_widget.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_body/note_fields.dart';
class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ImageWidget(),
        NoteFields(),
      ],
    );
  }
}