import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/config/routes/app_routes.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/core/extension/empty_padding_extension.dart';
import 'package:nota/core/extension/screen_size_extension.dart';
import 'package:nota/core/utils/app_strings.dart';
import 'package:nota/features/notes/domain/entities/drawer_item.dart';
part 'drawer_builder.dart';

part 'drawer_title.dart';

part 'drawer_tiles_list.dart';

part 'drawer_tile.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemUiOverlayStyle().copyWith(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
      ),
      child: Drawer(
        width: context.width/1.16,
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        child: const _DrawerBuilder(),
      ),
    );
  }
}
