import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/screens/add_note_screen.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_builder.dart';
class NoteWidget extends StatelessWidget{
  final Note note;
  final bool isGrid;
  const NoteWidget({super.key, required this.isGrid, required this.note});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation:5,
      openElevation: 10,
      openColor: Theme.of(context).colorScheme.background,
      closedColor:note.color==Colors.transparent.value ? Theme.of(context).colorScheme.background : Color(note.color),
      middleColor: Theme.of(context).colorScheme.background,
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      closedBuilder:(context, action) => NoteBuilder(note: note, isGrid: isGrid,onTap: action),
      openBuilder:(context, action) => AddNoteScreen(
          arrowBack: () => action,
          note: note,
        ),
    ).addSymmetricPadding(h: 7,v: 8);
  }
}