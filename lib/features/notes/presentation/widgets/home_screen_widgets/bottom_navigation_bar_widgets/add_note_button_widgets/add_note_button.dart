import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/screens/add_note_screen.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/bottom_navigation_bar_widgets/add_note_button_widgets/add_note_button_builder.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.width / 1.357,
      bottom: context.height - 707,
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 300),
        openColor: Theme.of(context).colorScheme.background,
        closedColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
        middleColor: Theme.of(context).colorScheme.background,
        closedElevation: 10,
        openElevation: 10,
        closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        openBuilder: (context, action) => const AddNoteScreen(),
        closedBuilder: (context, action) => AddNoteButtonBuilder(onTap: () {
          if (!BlocProvider.of<AppBarCubit>(context).isBase) {
            BlocProvider.of<AppBarCubit>(context).removeSelection();
          }
          action();
        }),

      ),
    );
  }
}
