import 'package:dartz/dartz.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/usecases/delete_note_use_case.dart';
import 'package:nota/features/notes/presentation/cubits/delete_notes_cubit/delete_notes_state.dart';
class DeleteNotesCubit extends Cubit<DeleteNotesStates> {
  final DeleteNoteUsecase _deleteNoteUseCase;
  DeleteNotesCubit(this._deleteNoteUseCase) : super(DeleteNotesInitialState());
  Future<void> deleteNote(List<Note> notes) async {
    emit(DeleteNoteLoadingState());
    Either<dynamic, void> result = await _deleteNoteUseCase(notes: notes);
    emit(
      result.fold(
            (l) => DeleteNoteErrorState(),
            (r) => DeleteNoteSuccessState(),
      ),
    );
  }
}