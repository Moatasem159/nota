import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/add_bottom_sheet/add_bottom_sheet_tile.dart';
class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BlocProvider.of<AddNoteCubit>(context).color ==
              Colors.transparent.value
          ? Theme.of(context).colorScheme.background
          : Color(BlocProvider.of<AddNoteCubit>(context).color),
      height: context.height / 8.658823529411765,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddBottomSheetTile(
              onTap: () => BlocProvider.of<AddNoteCubit>(context).getImageFromGallery(true),
              icon: Icons.camera_alt_outlined,
              title: AppStrings.takePhoto),
          AddBottomSheetTile(
              onTap: () => BlocProvider.of<AddNoteCubit>(context).getImageFromGallery(false),
              icon: Icons.image_outlined,
              title: AppStrings.addImage)
        ],
      ),
    );
  }
}
