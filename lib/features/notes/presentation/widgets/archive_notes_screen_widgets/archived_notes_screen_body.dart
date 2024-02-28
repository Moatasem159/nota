import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/change_list_view_cubit/change_list_view_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archived_notes_gird_view_list.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archived_notes_list_view.dart';
class ArchivedNotesScreenBody extends StatelessWidget {
  const ArchivedNotesScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeListViewCubit, bool>(
      builder: (context, state) {
        if (state) {
          return const ArchivedNotesGirdViewList();
        } else {
          return const ArchivedNotesListView();
        }
      },
    );
  }
}