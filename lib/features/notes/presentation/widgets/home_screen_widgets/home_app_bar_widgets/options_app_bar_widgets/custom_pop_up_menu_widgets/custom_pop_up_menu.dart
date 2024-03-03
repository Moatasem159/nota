import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archive_notes_cubit/archive_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archive_notes_cubit/archive_notes_state.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/custom_pop_up_menu_widgets/custom_pop_up_menu_item.dart';
class CustomPopUpMenu extends StatelessWidget {
  final bool inArchivedScreen;
  const CustomPopUpMenu({super.key, this.inArchivedScreen = false});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ArchiveNotesCubit, ArchiveNotesStates>(
      listener: (context, state) {
        if (state is ArchiveNoteSuccessState && inArchivedScreen) {
          BlocProvider.of<ArchivedNotesCubit>(context).getArchivedNotes();
          BlocProvider.of<AppBarCubit>(context).removeSelection();
        }
        if (state is ArchiveNoteSuccessState && !inArchivedScreen) {
          BlocProvider.of<NotesCubit>(context).getNotes();
          BlocProvider.of<AppBarCubit>(context).removeSelection();
        }
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.transparent,
        child: PopupMenuButton(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            splashRadius: 20,
            constraints:
                BoxConstraints(maxWidth: context.width / 1.894736842105263),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  onTap: () {
                    if (inArchivedScreen) {
                      BlocProvider.of<ArchiveNotesCubit>(context).archiveNote(
                          BlocProvider.of<AppBarCubit>(context).selectedNotes,
                          archive: false);
                    } else {
                      BlocProvider.of<ArchiveNotesCubit>(context).archiveNote(
                          BlocProvider.of<AppBarCubit>(context)
                              .selectedNotes);
                    }
                  },
                  child: CustomPopUpMenuItem(
                      title: inArchivedScreen
                          ? AppStrings.unArchive
                          : AppStrings.archive),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: const CustomPopUpMenuItem(title: AppStrings.delete),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert_outlined)),
      ),
    );
  }
}
