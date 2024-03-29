import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/custom_pop_up_menu_widgets/custom_pop_up_menu.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/notes_counter.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/home_app_bar_widgets/options_app_bar_widgets/pin_notes_button.dart';

class OptionsAppBar extends StatelessWidget {
  final NoteType noteType;
  const OptionsAppBar({super.key, this.noteType=NoteType.home});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      height: context.height / 10.51428571428571,
      child: Row(
        children: [
          CustomIconButton(
              onTap: BlocProvider.of<AppBarCubit>(context).removeSelection,
              icon: Icons.clear),
          const NotesCounter(),
          const Spacer(),
          if(noteType!=NoteType.archive)
          PinNotesButton(noteType: noteType),
          CustomIconButton(onTap: () {}, icon: Icons.notification_add_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.color_lens_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.label_outline_rounded),
          CustomPopUpMenu(noteType: noteType)
        ],
      ),
    ).addPadding(b: context.height / 66.90909090909091);
  }
}
