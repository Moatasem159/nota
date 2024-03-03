import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/presentation/screens/archived_notes_screen.dart';
import 'package:nota/features/notes/presentation/screens/deleted_notes_screen.dart';
import 'package:nota/features/notes/presentation/screens/home_screen.dart';
abstract class Routes {
  static const String initialRoute = "/";
  static const String homeRoute = "home";
  static const String reminderRoute = "reminder";
  static const String archivedRoute = "archived";
  static const String deletedRoute = "deleted";
  static const String settingsRoute = "settings";
}

abstract class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.initialRoute,
    routes: [
      GoRoute(
          path: Routes.initialRoute,
          name: Routes.homeRoute,
          builder: (__, _) => const HomeScreen(),
          routes: <GoRoute>[
            GoRoute(
              path: "archived",
              name: Routes.archivedRoute,
              builder: (__, state) => const ArchivedNotesScreen(),
            ),
            GoRoute(
              path: "deleted",
              name: Routes.deletedRoute,
              builder: (__, _) => const DeletedNotesScreen(),
            ),
          ]),
    ],
  );

  static String location() {
    final RouteMatch lastMatch =
        router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : router.routerDelegate.currentConfiguration;
    String location = matchList.uri.toString().replaceFirst("/", '');
    if (location.isEmpty) {
      location = Routes.homeRoute;
    }
    return location;
  }
}
