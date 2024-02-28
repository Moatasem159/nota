import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/injection_container.dart'as di show sl;
import 'package:nota/config/routes/app_routes.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/archive_notes_cubit/archive_notes_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/change_list_view_cubit/change_list_view_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_cubit.dart';
class Nota extends StatelessWidget {
  const Nota({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit(di.sl())..getNotes()),
        BlocProvider(create:(context) => AppBarCubit()),
        BlocProvider(create: (context) => ChangeListViewCubit()),
        BlocProvider(create: (context) => ArchiveNotesCubit(di.sl())),
        // BlocProvider(create: (context) => DeleteNotesCubit(di.sl())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoute.router,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}