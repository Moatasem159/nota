import 'package:flutter/material.dart';
import 'package:nota/features/notes/presentation/widgets/main_drawer_widgets/drawer_tile_widgets/drawer_tiles_list.dart';
import 'package:nota/features/notes/presentation/widgets/main_drawer_widgets/drawer_title.dart';
class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerTitle(),
        DrawerTilesList(),
      ],
    );
  }
}