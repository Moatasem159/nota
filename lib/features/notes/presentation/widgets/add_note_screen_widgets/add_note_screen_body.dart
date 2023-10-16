import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/core/utils/input_formatter/letter_limit_formatter.dart';
import 'package:nota/core/widgets/custom_text_form_field.dart';
import 'package:nota/core/widgets/toast/custom_toast.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 40,right: 15,left: 15),
      children: [
        (context.height / 49.06666666666667).ph,
        CustomTextFormField(
          controller: BlocProvider.of<AddNoteCubit>(context).title,
          formatter: [
            LetterLimitTextInputFormatter(150),
          ],
          autoValidateMode: AutovalidateMode.onUserInteraction,
          onChange: (value) {
            if(value.length>=150){
              CustomToast.showToast(context, msg: "Title too large");
            }
            BlocProvider.of<AddNoteCubit>(context).title.text = value;
          },
          hintText: AppStrings.title,
          minLines: 1,
          maxLines: 10,
          style: const TextStyle(fontSize: 22),
        ),
        10.ph,
        CustomTextFormField(
          controller: BlocProvider.of<AddNoteCubit>(context).content,
          onChange: (value) {
            BlocProvider.of<AddNoteCubit>(context).content.text = value;
          },
          autoFocus:  BlocProvider.of<AddNoteCubit>(context).content.text.isEmpty?true:false,
          hintText: AppStrings.note,
          maxLines: null,
          style: const TextStyle(fontSize: 16),
          hintStyle:Theme.of(context).inputDecorationTheme.hintStyle!.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}