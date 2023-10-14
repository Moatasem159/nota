import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_note_screen_bottom_sheet.dart';
class AddNoteScreen extends StatelessWidget {
  final VoidCallback arrowBack;
  const AddNoteScreen({super.key, required this.arrowBack});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle().copyWith(
          systemNavigationBarColor: Theme.of(context).colorScheme.background),
      child: WillPopScope(
        onWillPop: () async{
           arrowBack();
           return true;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar:  AddNoteScreenAppbar(arrowBack: arrowBack),
            body: Column(
              children: [TextFormField(autofocus: true)],
            ),
            bottomSheet: const AddNoteBottomSheet(),
          ),
        ),
      ),
    );
  }
}

