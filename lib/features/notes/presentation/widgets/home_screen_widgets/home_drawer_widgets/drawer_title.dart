import 'package:flutter/material.dart';
import 'package:nota/core/utils/app_strings.dart';
class DrawerTitle extends StatelessWidget {
  const DrawerTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Text(AppStrings.appTitle,style: Theme.of(context).textTheme.titleLarge),
    );
  }
}