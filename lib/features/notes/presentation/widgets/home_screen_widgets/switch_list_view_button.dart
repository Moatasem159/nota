import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/change_list_view_cubit/change_list_view_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
class SwitchListViewButton extends StatelessWidget {
  const SwitchListViewButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeListViewCubit, bool>(
      builder: (context, state) {
        return CustomIconButton(
            icon: state ? Icons.view_agenda_outlined:Icons.grid_view_rounded,
            onTap: BlocProvider.of<ChangeListViewCubit>(context).changeView);
      },
    );
  }
}