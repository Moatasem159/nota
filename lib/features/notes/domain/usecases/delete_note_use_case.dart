import 'package:dartz/dartz.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
class DeleteNoteUsecase{
  final NoteRepository _noteRepository;
  DeleteNoteUsecase(this._noteRepository);
  Future<Either<dynamic,void>>call({required List<Note> notes})async{
    return _noteRepository.deleteNotes(notes);
  }
}