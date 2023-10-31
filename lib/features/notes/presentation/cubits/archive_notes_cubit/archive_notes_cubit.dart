import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/archive_notes_cubit/archive_notes_state.dart';
class ArchiveNotesCubit extends Cubit<ArchiveNotesStates> {
  ArchiveNotesCubit() : super(ArchiveNotesInitialState());
}