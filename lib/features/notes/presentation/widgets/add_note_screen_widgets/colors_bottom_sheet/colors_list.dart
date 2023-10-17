import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/colors_bottom_sheet/color_container.dart';
class ColorsList extends StatelessWidget {
  const ColorsList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height/9.2,
      child: ListView.builder(
        itemCount: BlocProvider.of<ColorsBottomSheetCubit>(context).colors.length,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ColorContainer(index: index)),
    );
  }
}