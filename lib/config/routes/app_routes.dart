import 'package:go_router/go_router.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/screens/add_note_screen.dart';
import 'package:nota/features/notes/presentation/screens/home_screen.dart';
abstract class Routes {
  static const String initialRoute= "/";
  static const String noteRoute= "/noteRoute";
}
abstract class AppRoute{
  static final GoRouter router=GoRouter(
    routes: [
      GoRoute(
        path: Routes.initialRoute,
        name:Routes.initialRoute,
        builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: Routes.noteRoute,
        name:Routes.noteRoute,
        builder: (context, state) => AddNoteScreen(note: state.extra as Note)),
    ],
  );
}