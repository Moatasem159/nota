import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_bottom_sheet/add_bottom_sheet.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/colors_bottom_sheet/colors_bottom_sheet.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return BlocProvider<AddNoteCubit>.value(
                value: BlocProvider.of<AddNoteCubit>(context),
                child: const AddBottomSheet(),
              );
            },
          );
        }, icon: Icons.add_box_outlined),
        CustomIconButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return BlocProvider<AddNoteCubit>.value(
                    value: BlocProvider.of<AddNoteCubit>(context),
                    child: const ColorsBottomSheet(),
                  );
                },
              );
            },
            icon: Icons.color_lens_outlined),
        // const OpenTextStyleBarButton(),
        const Spacer(),
        CustomIconButton(onTap: () {}, icon: Icons.more_vert_rounded),
      ],
    );
  }
}