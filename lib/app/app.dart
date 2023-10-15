import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/config/routes/app_routes.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
class Nota extends StatelessWidget {
  const Nota({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NotesCubit()..getNotes(),
          )
        ],
        child: MaterialApp.router(
          routerConfig: AppRoute.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
        ));
  }
}
