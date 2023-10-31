import 'package:nota/core/database/hive_consumer.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
abstract class NoteLocalDataSource{
  Future<int> addNote(Note note);
  Future<void>archiveNote(Note note);
}
class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final HiveConsumer _hive;
  NoteLocalDataSourceImpl(this._hive);
  @override
  Future<int> addNote(Note note)async {
   if(!note.isEmpty()){
     return await _hive.add<Note>(AppConstants.noteBox,note);
   }
  return-1;
  }
  @override
  Future<void> archiveNote(Note note) async{
     note.delete();
    _hive.add<Note>(AppConstants.archiveNoteBox, note);
  }
}