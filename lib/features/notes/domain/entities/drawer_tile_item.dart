import 'package:flutter/material.dart';
class DrawerTileItem{
  final String title;
  final IconData icon;
  final String route;
  bool isSelected;
  DrawerTileItem({required this.title, required this.icon,this.isSelected=false,required this.route});
}