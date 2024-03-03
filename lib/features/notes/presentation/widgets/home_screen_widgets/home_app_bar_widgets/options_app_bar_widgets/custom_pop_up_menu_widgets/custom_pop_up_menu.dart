import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/injection_container.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_actions_bloc/notes_actions_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/custom_pop_up_menu_widgets/custom_pop_up_menu_item.dart';
class CustomPopUpMenu extends StatelessWidget {
  final NoteType noteType;
  const CustomPopUpMenu({super.key,this.noteType=NoteType.home});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesActionsBloc(sl()),
      child: Builder(
        builder: (context) {
          return BlocListener<NotesActionsBloc, NotesActionsState>(
            listener: (context, state) {
              if (state is ActionSuccessState && noteType==NoteType.archive) {
                BlocProvider.of<ArchivedNotesCubit>(context).getArchivedNotes();
              }
              if (state is ActionSuccessState) {
                BlocProvider.of<NotesCubit>(context).getNotes();
                BlocProvider.of<AppBarCubit>(context).removeSelection();
              }
            },
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.transparent,
              child: PopupMenuButton(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  splashRadius: 20,
                  constraints: BoxConstraints(
                      maxWidth: context.width / 1.894736842105263),
                  itemBuilder: (_) {
                    return [
                      if(noteType!=NoteType.delete)
                      PopupMenuItem(
                        onTap: () {
                          if (noteType==NoteType.archive) {
                            BlocProvider.of<NotesActionsBloc>(context).add(
                              ArchiveNote(
                                  BlocProvider.of<AppBarCubit>(context)
                                      .selectedNotes,
                                  false),
                            );
                          } else {
                            BlocProvider.of<NotesActionsBloc>(context).add(
                              ArchiveNote(
                                  BlocProvider.of<AppBarCubit>(context)
                                      .selectedNotes,
                                  true),
                            );
                          }
                        },
                        child: CustomPopUpMenuItem(
                            title: noteType==NoteType.archive
                                ? AppStrings.unArchive
                                : AppStrings.archive),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: CustomPopUpMenuItem(title: noteType==NoteType.delete?AppStrings.restore:AppStrings.delete),
                      ),
                    ];
                  },
                  icon: const Icon(Icons.more_vert_outlined)),
            ),
          );
        },
      ),
    );
  }
}
