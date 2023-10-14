import 'package:flutter/material.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/search_bar_widget.dart';
import 'package:nota/features/notes/presentation/widgets/note_widgets/notes_list_widgets/notes_grid_list.dart';
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      slivers: const [
        SliverToBoxAdapter(child: SearchBarWidget()),
        NotesGridList()
      ],
    );
  }
}