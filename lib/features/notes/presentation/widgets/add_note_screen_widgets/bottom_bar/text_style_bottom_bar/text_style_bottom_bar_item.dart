// import 'package:flutter/material.dart';
// import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
// class TextStyleBottomBarItem extends StatelessWidget{
//   final bool isChosen;
//   final VoidCallback onTap;
//   final dynamic iconData;
//   final double ?iconSize;
//   final bool isSvg;
//   const TextStyleBottomBarItem({super.key,this.isChosen=false, required this.onTap, this.iconData, this.iconSize,this.isSvg=false});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 0),
//       child: Material(
//         color: isChosen?Theme.of(context).primaryColorLight:Colors.transparent,
//         borderRadius: BorderRadius.circular(5),
//         clipBehavior: Clip.hardEdge,
//         child: InkWell(
//           splashColor: Colors.grey,
//           onTap:onTap,
//           child: CustomIconButton(
//             iconColor: isChosen?Theme.of(context).primaryColorDark:Theme.of(context).iconTheme.color!,
//             icon:iconData,iconSize: iconSize,isSvg: isSvg,),
//         ),
//       ),
//     );
//   }
// }