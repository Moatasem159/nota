import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_state.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/colors_bottom_sheet/chosen_color_widget.dart';
class ColorContainer extends StatelessWidget {
  final int index;
  const ColorContainer({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsBottomSheetCubit, ColorsBottomSheetStates>(
      builder: (context, state) {
        ColorsBottomSheetCubit cubit = BlocProvider.of<ColorsBottomSheetCubit>(context);
        return GestureDetector(
          onTap: () {
            cubit.chooseColor(index);
            BlocProvider.of<AddNoteCubit>(context).changeColor(BlocProvider.of<ColorsBottomSheetCubit>(context).colors[index].value);
          },
          child: Container(
            height: context.height/13.38181818181818,
            width:context.width/6.545454545454545,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: cubit.colors[index] == Colors.transparent
                    ? Theme.of(context).colorScheme.background
                    : cubit.colors[index],
                shape: BoxShape.circle,
                border:
                    BlocProvider.of<ColorsBottomSheetCubit>(context).colors[index] == Colors.transparent ?
                    Border.all(color: !cubit.chosen[index] ? Colors.white : Colors.transparent) : null),
            child: cubit.chosen[index]
                ? const ChosenColorWidget()
                : (cubit.colors[index] == Colors.transparent && !cubit.chosen[index])
                    ? const Icon(Icons.format_color_reset_outlined)
                    : null,
          ),
        );
      },
    );
  }
}