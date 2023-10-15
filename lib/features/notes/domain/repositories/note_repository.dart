import 'package:dartz/dartz.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
abstract class NoteRepository{
  Future<Either<dynamic,int>> addNote(Note note);
}