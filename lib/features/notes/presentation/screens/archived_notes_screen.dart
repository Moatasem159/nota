import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/injection_container.dart';
import 'package:nota/config/themes/app_theme.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_cubit.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_cubit.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archive_screen_appbar.dart';
import 'package:nota/features/notes/presentation/widgets/archive_notes_screen_widgets/archived_notes_screen_body.dart';
import 'package:nota/features/notes/presentation/widgets/custom_drawer_widgets/main_drawer.dart';

class ArchivedNotesScreen extends StatelessWidget {
  const ArchivedNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchivedNotesCubit(sl())..getArchivedNotes(),
      child: BlocBuilder<AppBarCubit, AppBarStates>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.systemUiOverlayStyle().copyWith(
              systemNavigationBarColor:
                  Theme.of(context).colorScheme.background,
              statusBarColor: !BlocProvider.of<AppBarCubit>(context).isBase
                  ? Theme.of(context).appBarTheme.backgroundColor
                  : null,
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Theme.of(context).colorScheme.background,
                appBar: const ArchiveScreenAppBar(),
                drawer: const CustomDrawer(),
                body: const ArchivedNotesScreenBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
