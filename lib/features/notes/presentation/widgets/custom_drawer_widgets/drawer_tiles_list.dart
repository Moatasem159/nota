part of 'main_drawer.dart';

class _DrawerTilesList extends StatefulWidget {
  const _DrawerTilesList();

  @override
  State<_DrawerTilesList> createState() => _DrawerTilesListState();
}

class _DrawerTilesListState extends State<_DrawerTilesList> {
  late final List<DrawerItem> drawerItems;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    drawerItems = [
      DrawerItem(title: AppStrings.notes, icon: Icons.lightbulb_outline,location: Routes.homeRoute),
      DrawerItem(title: AppStrings.reminder, icon: Icons.notifications_none_outlined),
      DrawerItem(title: AppStrings.createNewLabel, icon: Icons.add),
      DrawerItem(title: AppStrings.archive, icon: Icons.archive_outlined,location: Routes.archivedRoute),
      DrawerItem(title: AppStrings.deleted, icon: Icons.delete_outline_rounded,location: Routes.deletedRoute),
      DrawerItem(title: AppStrings.settings, icon: Icons.settings_outlined),
      DrawerItem(title: AppStrings.help, icon: Icons.help_outline_outlined),
    ];
  }

  void onTap(DrawerItem e) {
    if(e.location.isEmpty){
      context.pop();
    }
    else if (e.location == Routes.settingsRoute) {
      context.pop();
      context.pushNamed(e.location);
    }
    else if (AppRoute.location() != e.location) {
      context.pop();
      context.goNamed(e.location);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: drawerItems
          .map((DrawerItem e) =>
              _DrawerTile(item: e, onTap: () => onTap(e)))
          .toList(),
    );
  }
}
