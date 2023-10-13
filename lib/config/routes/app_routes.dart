import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/presentation/screens/home_screen.dart';
abstract class Routes {
  static const String initialRoute= "/";
}
abstract class AppRoute{
  static final GoRouter router=GoRouter(
    routes: [
      GoRoute(
        path: Routes.initialRoute,
        name:Routes.initialRoute,
        builder: (context, state) => const HomeScreen()),
    ],
  );
}