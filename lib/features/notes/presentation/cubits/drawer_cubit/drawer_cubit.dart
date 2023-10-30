import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/domain/entities/drawer_tile_item.dart';
import 'package:nota/features/notes/presentation/cubits/drawer_cubit/drawer_state.dart';
class DrawerCubit extends Cubit<DrawerStates> {
  DrawerCubit() : super(DrawerInitialState());
  List<DrawerTileItem> drawerTileItems=[
    DrawerTileItem(title: AppStrings.notes, icon: Icons.lightbulb_outline,isSelected: true),
    DrawerTileItem(title: AppStrings.reminder, icon: Icons.notifications_none_outlined,isSelected: false),
    DrawerTileItem(title: AppStrings.createNewLabel, icon: Icons.add,isSelected: false),
    DrawerTileItem(title: AppStrings.archive, icon: Icons.archive_outlined,isSelected: false),
    DrawerTileItem(title: AppStrings.deleted, icon: Icons.delete_outline_rounded,isSelected: false),
    DrawerTileItem(title: AppStrings.settings, icon: Icons.settings_outlined,isSelected: false),
    DrawerTileItem(title: AppStrings.help, icon: Icons.help_outline_outlined,isSelected: false),
  ];
  chooseItem(DrawerTileItem item){
   for(int i=0;i<drawerTileItems.length;i++){
     drawerTileItems[i].isSelected = false;
   }
   drawerTileItems.firstWhere((element) => element==item).isSelected = true;
   emit(ChooseState());
  }
}