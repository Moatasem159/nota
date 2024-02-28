import 'package:flutter/material.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
class EmptyBody extends StatelessWidget {
  final String title;
  final IconData icon;
  const EmptyBody({super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: 135),
          15.ph,
          Text(title,style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}
