import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomIconButton({super.key, required this.onTap, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: IconButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          splashRadius: 18,
          icon:Icon(icon)),
    );
  }
}