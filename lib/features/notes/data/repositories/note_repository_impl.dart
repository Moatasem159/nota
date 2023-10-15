import 'package:dartz/dartz.dart';
import 'package:nota/features/notes/data/datasources/note_local_data_source.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
class NoteRepositoryImpl implements NoteRepository{
  final NoteLocalDataSource _noteLocalDataSource;
  NoteRepositoryImpl(this._noteLocalDataSource);
  @override
  Future<Either<dynamic,int>>  addNote(Note note) async{
   try{
     final res =await _noteLocalDataSource.addNote(note);
     return right(res);
   }catch (e){
     return Left(e.toString());
   }
  }
}