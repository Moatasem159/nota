import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/widgets/custom_drawer_widgets/main_drawer.dart';
import 'package:nota/features/notes/presentation/widgets/deleted_notes_screen_widgets/deleted_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/empty_body.dart';
class DeletedNotesScreen extends StatelessWidget {
  const DeletedNotesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const DeletedScreenAppBar(),
        drawer: const CustomDrawer(),
        body: const EmptyBody(title: AppStrings.deletedBodyTitle, icon: Icons.delete_outline),
      ),
    );
  }
}
