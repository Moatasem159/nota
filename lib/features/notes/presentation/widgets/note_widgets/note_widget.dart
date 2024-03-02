import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/screens/add_note_screen.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_builder.dart';
class NoteWidget extends StatelessWidget {
  final Note note;
  final bool isGrid;
  const NoteWidget({super.key, required this.isGrid, required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:7,vertical: 8 ),
      child: OpenContainer(
        closedElevation: 5,
        openElevation: 10,
        openColor: Theme.of(context).colorScheme.background,
        closedColor: note.color == Colors.transparent.value
            ? Theme.of(context).colorScheme.background
            : Color(note.color),
        middleColor: Theme.of(context).colorScheme.background,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        openBuilder: (_, action) => AddNoteScreen(note: note),
        closedBuilder: (_, action) => BlocProvider<AppBarCubit>.value(
          value: BlocProvider.of<AppBarCubit>(context),
          child: NoteBuilder(
              note: note,
              isGrid: isGrid,
              onTap: () {
                if (BlocProvider.of<AppBarCubit>(context).isBase) {
                  action();
                }
              }),
        ),
      ),
    );
  }
}