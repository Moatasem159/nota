import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteStates>(
      listener: (context, state) {
        if(state is PickImageState)
        {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        if (BlocProvider.of<AddNoteCubit>(context).note.imagePath.isNotEmpty) {
          return Stack(
            children: [
              Image(image: FileImage(File(BlocProvider.of<AddNoteCubit>(context).note.imagePath))),
              Container(
                  width: 30,
                  height:30,
                  margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                  decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black26
                  ),
                  child: CustomIconButton(onTap: BlocProvider.of<AddNoteCubit>(context).removeImage, icon: Icons.clear))
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}