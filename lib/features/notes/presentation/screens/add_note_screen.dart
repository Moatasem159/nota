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
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_body.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_bottom_sheet.dart';
class AddNoteScreen extends StatelessWidget {
  final Note? note;
  final VoidCallback? arrowBack;
  const AddNoteScreen({super.key, this.arrowBack, this.note});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: note ?? '',
      child: BlocProvider(
        create: (context) => AddNoteCubit(di.sl())..title.text = note?.title ?? ''..content.text = note?.note ?? '',
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (BuildContext context, AddNoteStates state) {
            if (state is AddNoteSuccessState && state.isAdded) {
              BlocProvider.of<NotesCubit>(context).getNotes();
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.systemUiOverlayStyle().copyWith(systemNavigationBarColor: Theme.of(context).colorScheme.background),
              child: WillPopScope(
                onWillPop: () async {
                  if (arrowBack != null)
                  {
                    BlocProvider.of<AddNoteCubit>(context).addNote();
                    arrowBack!();
                  }
                  else
                  {
                    BlocProvider.of<AddNoteCubit>(context).editNote(note!);
                    BlocProvider.of<NotesCubit>(context).getNotes();
                  }
                  return true;
                },
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    appBar: AddNoteScreenAppbar(
                      arrowBack: () {
                        if (arrowBack != null)
                        {
                          arrowBack!();
                          BlocProvider.of<AddNoteCubit>(context).addNote();
                        }
                        else
                        {
                          BlocProvider.of<AddNoteCubit>(context).editNote(note!);
                          BlocProvider.of<NotesCubit>(context).getNotes();
                          GoRouter.of(context).pop();
                        }
                      },
                    ),
                    body: const AddNoteScreenBody(),
                    bottomSheet: const AddNoteBottomSheet(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}