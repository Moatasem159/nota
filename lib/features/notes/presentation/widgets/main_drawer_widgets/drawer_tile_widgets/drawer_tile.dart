import 'package:flutter/material.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/features/notes/domain/entities/drawer_tile_item.dart';
class DrawerTile extends StatelessWidget {
  final DrawerTileItem item;
  final VoidCallback ?onTap;
  const DrawerTile({super.key,required this.item,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: item.isSelected ?Colors.blueGrey:Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),
            margin: const EdgeInsets.symmetric(vertical: 9,horizontal: 8),
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Icon(item.icon),
                15.pw,
                Text(item.title,style: Theme.of(context).textTheme.labelLarge)
              ],
            ),
          ),
        ),
      ),
    );
  }
}