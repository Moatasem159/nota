import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/note_widget.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/list_title.dart';
class NotesNormalList extends StatelessWidget {
  final bool inArchivedScreen;
  const NotesNormalList({super.key, required this.inArchivedScreen});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if(BlocProvider.of<NotesCubit>(context).pinnedNotes.isNotEmpty)
            const SliverToBoxAdapter(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: ListTitle(title: AppStrings.pinned),
            )),
            SliverList(delegate: SliverChildBuilderDelegate(
                childCount: BlocProvider.of<NotesCubit>(context).pinnedNotes.length,
              (context, index) => NoteWidget(inArchivedScreen: inArchivedScreen,isGrid: false, note: BlocProvider.of<NotesCubit>(context).pinnedNotes[index]))),
            if(BlocProvider.of<NotesCubit>(context).pinnedNotes.isNotEmpty&&BlocProvider.of<NotesCubit>(context).notes.isNotEmpty)
            const SliverToBoxAdapter(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: ListTitle(title: AppStrings.others),
            )),
            SliverList(delegate: SliverChildBuilderDelegate(
              childCount: BlocProvider.of<NotesCubit>(context).notes.length,
                    (context, index) =>NoteWidget(inArchivedScreen: inArchivedScreen,isGrid: false, note: BlocProvider.of<NotesCubit>(context).notes[index]))),
            SliverToBoxAdapter(child: (context.height/13).ph)
          ],
        );
      },
    );
  }
}