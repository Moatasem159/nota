import 'package:flutter/material.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archive_empty_body.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archive_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/main_drawer_widgets/main_drawer.dart';
class ArchiveNotesScreen extends StatelessWidget {
  const ArchiveNotesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const ArchiveScreenAppBar(),
        drawer: const MainDrawer(),
        body: const ArchiveEmptyBody(),
      ),
    );
  }
}