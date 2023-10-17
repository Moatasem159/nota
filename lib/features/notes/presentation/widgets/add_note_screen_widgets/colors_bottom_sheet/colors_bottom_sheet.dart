import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/colors_bottom_sheet/colors_list.dart';
class ColorsBottomSheet extends StatelessWidget {
  const ColorsBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorsBottomSheetCubit()..initializeColor(BlocProvider.of<AddNoteCubit>(context).color),
      child: BlocBuilder<AddNoteCubit, AddNoteStates>(
        builder: (context, state) {
          return Container(
            color: BlocProvider.of<AddNoteCubit>(context).color == Colors.transparent.value
                ? Theme.of(context).colorScheme.background
                : Color(BlocProvider.of<AddNoteCubit>(context).color),
            height: context.height/5.257142857142857,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(AppStrings.color, style: Theme.of(context).textTheme.titleLarge),
                ),
                const ColorsList(),
                (context.height/73.6).ph
              ],
            ),
          );
        },
      ),
    );
  }
}