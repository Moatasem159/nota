import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class PinNotesButton extends StatelessWidget {
  final bool inArchivedScreen;
  const PinNotesButton({super.key, required this.inArchivedScreen});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBarCubit, AppBarStates>(
      listener: (context, state) {
        if(!inArchivedScreen)
        {
          if(state is PinNotesSuccessState)
          {
            BlocProvider.of<NotesCubit>(context).getNotes();
          }
        }
      },
      builder: (context, state) {
        return CustomIconButton(
            onTap: BlocProvider.of<AppBarCubit>(context).pinNotes,
            icon: BlocProvider.of<AppBarCubit>(context).isPinned ?Icons.push_pin_rounded:Icons.push_pin_outlined);
      },
    );
  }
}