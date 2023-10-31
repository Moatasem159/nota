import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/presentation/cubits/drawer_cubit/drawer_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/drawer_cubit/drawer_state.dart';
import 'package:nota/features/notes/presentation/widgets/main_drawer_widgets/drawer_tile_widgets/drawer_tile.dart';
class DrawerTilesList extends StatelessWidget {
  const DrawerTilesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerStates>(
      builder: (context, state) {
        return Column(
            children: BlocProvider.of<DrawerCubit>(context)
                .drawerTileItems.map((e) => DrawerTile(
                onTap: () {
                  GoRouter.of(context).pushNamed(e.route);
                  BlocProvider.of<DrawerCubit>(context).chooseItem(e);
                  GoRouter.of(context).pop();
                },
                item: e)).toList());
      },
    );
  }
}