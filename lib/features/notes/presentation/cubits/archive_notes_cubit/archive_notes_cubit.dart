import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/usecases/archive_note_usecase.dart';
import 'package:nota/features/notes/presentation/cubits/archive_notes_cubit/archive_notes_state.dart';
class ArchiveNotesCubit extends Cubit<ArchiveNotesStates> {
  final ArchiveNoteUsecase _archiveNoteUsecase;
  ArchiveNotesCubit(this._archiveNoteUsecase) : super(ArchiveNotesInitialState());
  Future<void> archiveNote(List<Note> notes,{bool archive=true}) async {
    emit(ArchiveNoteLoadingState());
    Either<dynamic, void> result = await _archiveNoteUsecase(notes: notes,archive: archive);
    emit(result.fold(
        (l) => ArchiveNoteErrorState(),
      (r) => ArchiveNoteSuccessState(inArchivedScreen: !archive)));
  }
  listen(BuildContext context, state){


  }
}