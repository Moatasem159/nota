part of'main_drawer.dart';
class _DrawerBuilder extends StatelessWidget {
  const _DrawerBuilder();
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DrawerTitle(),
        _DrawerTilesList(),
      ],
    );
  }
}