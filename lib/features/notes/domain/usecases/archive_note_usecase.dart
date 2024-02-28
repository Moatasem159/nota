import 'package:dartz/dartz.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
class ArchiveNoteUsecase{
  final NoteRepository _noteRepository;
  ArchiveNoteUsecase(this._noteRepository);
  Future<Either<dynamic,void>>call({required List<Note> notes,bool archive=true})async{
    return _noteRepository.archiveNotes(notes,archive: archive);
  }
}