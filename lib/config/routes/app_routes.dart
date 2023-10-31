import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/presentation/screens/archive_notes_screen.dart';
import 'package:nota/features/notes/presentation/screens/home_screen.dart';
abstract class Routes {
  static const String initialRoute= "/";
  static const String archiveNotesRoute= "/archiveNotesRoute";
}
abstract class AppRoute{
  static final GoRouter router=GoRouter(
    routes: [
      GoRoute(
        path: Routes.initialRoute,
        name:Routes.initialRoute,
        builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: Routes.archiveNotesRoute,
        name:Routes.archiveNotesRoute,
        builder: (context, state) => const ArchiveNotesScreen()),
    ],
  );
}