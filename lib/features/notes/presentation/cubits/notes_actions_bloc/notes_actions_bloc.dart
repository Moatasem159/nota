import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/usecases/archive_note_usecase.dart';
part 'notes_actions_event.dart';
part 'notes_actions_state.dart';
class NotesActionsBloc extends Bloc<NotesActionsEvent, NotesActionsState> {
  final ArchiveNoteUsecase _archiveNoteUsecase;
  NotesActionsBloc(this._archiveNoteUsecase) : super(NotesActionsInitial()) {
    on<ArchiveNote>(
      (ArchiveNote event, emit) => archive(
        emit,
        event.archivedNotes,
        event.archive,
      ),
    );
    on<DeleteNote>((DeleteNote event, emit) {});
  }
  Future<void> archive(emit,List<Note> archivedNotes,bool archive) async {
    emit(ActionLoadingState());
    Either<dynamic, void> result = await _archiveNoteUsecase(notes: archivedNotes, archive: archive);
    emit(
      result.fold(
        (l) => ActionErrorState(),
        (r) => ActionSuccessState(),
      ),
    );
  }
}
