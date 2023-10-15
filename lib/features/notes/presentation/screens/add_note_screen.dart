import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/injection_container.dart' as di show sl;
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_body.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_bottom_sheet.dart';
class AddNoteScreen extends StatelessWidget {
  final VoidCallback arrowBack;
  const AddNoteScreen({super.key, required this.arrowBack});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(di.sl()),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (context, state) {
          if(state is AddNoteSuccessState){
            BlocProvider.of<NotesCubit>(context).getNotes();
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
                systemNavigationBarColor:
                    Theme.of(context).colorScheme.background),
            child: WillPopScope(
              onWillPop: () async {
                arrowBack();
                BlocProvider.of<AddNoteCubit>(context).addNote();
                return true;
              },
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  appBar: AddNoteScreenAppbar(arrowBack: () {
                    arrowBack();
                    BlocProvider.of<AddNoteCubit>(context).addNote();
                  }),
                  body: const AddNoteScreenBody(),
                  bottomSheet: const AddNoteBottomSheet(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
