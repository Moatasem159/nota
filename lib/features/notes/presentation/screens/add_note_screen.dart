import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/app/injection_container.dart' as di show sl;
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_body/add_note_screen_body_builder.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/bottom_bar/add_note_bottom_bar.dart';
class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final VoidCallback arrowBack;
  const AddNoteScreen({super.key,required this.arrowBack, this.note});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(di.sl())
      ..note=note??Note(date: DateTime.now().toIso8601String(),color:Colors.transparent.value)
        ..title.text = note?.title ?? ''
        ..content.text = note?.note ?? '',
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (BuildContext context, AddNoteStates state) {
          if (state is AddNoteSuccessState && state.isAdded) {
            BlocProvider.of<NotesCubit>(context).getNotes();
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          AddNoteCubit cubit = BlocProvider.of<AddNoteCubit>(context);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
                statusBarColor: cubit.note.color == Colors.transparent.value?Theme.of(context).colorScheme.background : Color(cubit.note.color),
                systemNavigationBarColor:cubit.note.color == Colors.transparent.value?Theme.of(context).colorScheme.background:Color(cubit.note.color)),
            child: WillPopScope(
              onWillPop: () async {
                if (note == null) {
                  BlocProvider.of<AddNoteCubit>(context).addNote();
                  arrowBack();
                }
                else {
                  BlocProvider.of<AddNoteCubit>(context).editNote(note!);
                  BlocProvider.of<NotesCubit>(context).getNotes(edit: true);
                }
                return true;
              },
              child: SafeArea(
                child: Scaffold(
                    backgroundColor:cubit.note.color==Colors.transparent.value ? Theme.of(context).colorScheme.background : Color(cubit.note.color),
                    appBar: AddNoteScreenAppbar(
                      arrowBack: () {
                        if (note == null) {
                          BlocProvider.of<AddNoteCubit>(context).addNote();
                          arrowBack();
                        } else {
                          BlocProvider.of<AddNoteCubit>(context).editNote(note!);
                          BlocProvider.of<NotesCubit>(context).getNotes(edit: true);
                          GoRouter.of(context).pop();
                        }
                      },
                    ),
                    body: const AddNoteScreenBody(),
                    bottomNavigationBar: const AddNoteBottomNavBar()),
              ),
            ),
          );
        },
      ),
    );
  }
}