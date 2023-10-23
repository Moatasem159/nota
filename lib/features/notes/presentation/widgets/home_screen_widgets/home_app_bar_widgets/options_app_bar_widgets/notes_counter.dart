import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
class NotesCounter extends StatelessWidget {
  const NotesCounter({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarStates>(
      builder: (context, state) {
        return Text(BlocProvider.of<AppBarCubit>(context).selectedNotes.length.toString(),
            style: Theme.of(context).textTheme.titleMedium);
      },
    );
  }
}