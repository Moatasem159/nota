import 'package:flutter/material.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: context.width,
      child: Row(
        children: [
          CustomIconButton(onTap: () {}, icon: Icons.add_box_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.color_lens_outlined),
          CustomIconButton(onTap: () {}, icon: Icons.text_format,iconSize: 28),
          const Spacer(),
          CustomIconButton(onTap: () {}, icon: Icons.more_vert_rounded),
        ],
      ),
    );
  }
}