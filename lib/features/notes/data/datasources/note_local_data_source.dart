import 'package:hive/hive.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
abstract class NoteLocalDataSource{
  Future<int> addNote(Note note);
}
class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  @override
  Future<int> addNote(Note note)async {
   Box hive=Hive.box<Note>(AppConstants.noteBox);
   return await hive.add(note);
  }
}