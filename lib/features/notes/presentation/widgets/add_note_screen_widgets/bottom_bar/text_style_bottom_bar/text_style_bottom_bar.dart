// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nota/core/extension/screen_size_extension.dart';
// import 'package:nota/core/utils/app_icons.dart';
// import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_cubit.dart';
// import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
// import 'package:nota/features/notes/presentation/cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
// import 'package:nota/features/notes/presentation/widgets/add_note_screen_widgets/bottom_bar/text_style_bottom_bar/text_style_bottom_bar_item.dart';
// import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
// class TextStyleBottomBar extends StatelessWidget {
//   const TextStyleBottomBar({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: context.width - 48,
//           child: BlocBuilder<AddNoteCubit, AddNoteStates>(
//             builder: (context, state) {
//               return ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   TextStyleBottomBarItem(
//                     onTap: () => BlocProvider.of<AddNoteCubit>(context).changeFontSize(30),
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).fontSize==30?true:false,
//                     iconData: AppIcons.h1,
//                     iconSize: 50,
//                     isSvg: true,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap: ()=>    BlocProvider.of<AddNoteCubit>(context).changeFontSize(24),
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).fontSize==24?true:false,
//                     iconData: AppIcons.h2,
//                     iconSize: 50,
//                     isSvg: true,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap: () => BlocProvider.of<AddNoteCubit>(context).changeFontSize(18),
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).fontSize==18?true:false,
//                     iconData: Icons.format_size_rounded,
//                     iconSize: 33,
//                   ),
//                   Container(
//                     width: 2,
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     color: Colors.grey,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap:BlocProvider.of<AddNoteCubit>(context).changeBold,
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).isBold,
//                     iconData: Icons.format_bold_rounded,
//                     iconSize: 33,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap: BlocProvider.of<AddNoteCubit>(context).changeItalic,
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).isItalic,
//                     iconData: Icons.format_italic_rounded,
//                     iconSize: 33,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap:BlocProvider.of<AddNoteCubit>(context).changeUnderlined,
//                     isChosen: BlocProvider.of<AddNoteCubit>(context).isUnderline,
//                     iconData: Icons.format_underline_rounded,
//                     iconSize: 35,
//                   ),
//                   TextStyleBottomBarItem(
//                     onTap:BlocProvider.of<AddNoteCubit>(context).removeStyles,
//                     iconData: Icons.format_clear_rounded,
//                     iconSize: 35,
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         CustomIconButton(onTap: () {
//           BlocProvider.of<BottomBarCubit>(context).hideBottomStyleBar();
//         }, icon: Icons.clear_rounded, iconSize: 30),
//       ],
//     );
//   }
// }
//
//
//
//
//
// // QuillToolbar.basic(
// // controller: BlocProvider.of<AddNoteCubit>(context).controller,
// // showAlignmentButtons: false,
// // showColorButton: false,
// // showCodeBlock: false,
// // showBackgroundColorButton: false,
// // showCenterAlignment: false,
// // showDirection: false,
// // showSuperscript: false,
// // showSubscript: false,
// // showStrikeThrough: false,
// // showSearchButton: false,
// // showSmallButton: false,
// // showQuote: false,
// // showListNumbers: false,
// // showRightAlignment: false,
// // showListCheck: false,
// // showHeaderStyle: false,
// // showListBullets: false,
// // showLink: false,
// // showJustifyAlignment: false,
// // showIndent: false,
// // showDividers: false,
// // showInlineCode: false,
// // showLeftAlignment: false,
// // showFontFamily: false,
// // showUndo: false,
// // showRedo: false,
// // showFontSize: false,
// // fontFamilyValues: const {"en":AppFonts.englishFontFamily},
// // customButtons: [
// //
// // ],
// // );