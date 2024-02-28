import 'package:nota/core/database/hive_consumer.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';

abstract class NoteLocalDataSource {
  Future<int> addNote(Note note);

  Future<void> archiveNotes(List<Note> note,{bool archive=true});

  Future<void> deleteNotes(List<Note> note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final HiveConsumer _hive;

  NoteLocalDataSourceImpl(this._hive);

  @override
  Future<int> addNote(Note note) async {
    if (!note.isEmpty()) {
      return await _hive.add<Note>(AppConstants.noteBox, note);
    }
    return -1;
  }

  @override
  Future<void> archiveNotes(List<Note> notes, {bool archive = true}) async {
    List<Note> newNotes=[];
    newNotes.addAll(notes);
    if (archive) {
      for (int i = 0; i < notes.length; i++) {
        await notes[i].delete();
        newNotes[i].boxName = AppConstants.archivedNoteBox;
      }
      await _hive.addAll<Note>(AppConstants.archivedNoteBox, newNotes);
    }
    else{
      for (int i = 0; i < notes.length; i++) {
        await notes[i].delete();
        newNotes[i].boxName = AppConstants.noteBox;
      }
      await _hive.addAll<Note>(AppConstants.noteBox, newNotes);
    }
  }

  @override
  Future<void> deleteNotes(List<Note> notes) async {
    for (int i = 0; i < notes.length; i++) {
      notes[i].delete();
    }
    await _hive.addAll<Note>(AppConstants.deletedNoteBox, notes);
  }
}
