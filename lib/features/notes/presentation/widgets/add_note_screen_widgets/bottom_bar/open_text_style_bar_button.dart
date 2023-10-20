// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nota/features/notes/presentation/cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
// import 'package:nota/features/notes/presentation/cubits/bottom_bar_cubit/bottom_bar_state.dart';
// import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
// class OpenTextStyleBarButton extends StatelessWidget {
//   const OpenTextStyleBarButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomBarCubit, BottomBarStates>(
//       builder: (context, state) {
//         return CustomIconButton(
//             onTap: () {
//               if (BlocProvider.of<BottomBarCubit>(context).showStyleBar) {
//                 BlocProvider.of<BottomBarCubit>(context).showBottomStyleBar();
//               }
//             },
//             iconColor: BlocProvider.of<BottomBarCubit>(context).showStyleBar
//                 ? Theme.of(context).iconTheme.color
//                 : Colors.grey,
//             icon: Icons.text_format,
//             iconSize: 28);
//       },
//     );
//   }
// }