import 'package:flutter/material.dart';
import 'package:nota/core/extension/custom_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_fonts.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:nota/features/notes/presentation/widgets/home_screen_widgets/switch_list_view_button.dart';
class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).appBarTheme.backgroundColor,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          child: Row(
            children: [
              CustomIconButton(icon: Icons.menu_rounded, onTap: () {Scaffold.of(context).openDrawer();}),
              Text(
                AppStrings.searchMsg,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppFontSize.f14, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const SwitchListViewButton(),
            ],
          ),
        ),
      ),
    ).addSymmetricPadding(
        h: context.width / 18, v: context.height / 66.90909090909091);
  }
}