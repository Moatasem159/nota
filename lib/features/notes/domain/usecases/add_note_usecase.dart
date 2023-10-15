import 'package:dartz/dartz.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
class AddNoteUsecase{
  final NoteRepository _noteRepository;
  AddNoteUsecase(this._noteRepository);
  Future<Either<dynamic,int>>call({required Note note})async{
    return _noteRepository.addNote(note);
  }
}