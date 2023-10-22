import 'package:flutter/material.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
class AddBottomSheetTile extends StatelessWidget {
  final VoidCallback  onTap;
  final IconData icon;
  final String title;
  const AddBottomSheetTile({super.key, required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          10.pw,
          Text(title)
        ],
      ),
    ).addAllPadding(8);
  }
}