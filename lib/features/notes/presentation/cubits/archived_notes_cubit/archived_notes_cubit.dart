import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/database/hive_consumer.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/archived_notes_cubit/archived_notes_state.dart';
class ArchivedNotesCubit extends Cubit<ArchivedNotesStates> {
  final HiveConsumer _hive;
  ArchivedNotesCubit(this._hive) : super(ArchivedNotesInitialState()){
    archivedNotes=[];
  }
  late List<Note> archivedNotes;
  getArchivedNotes()async{
    await _hive.openBox<Note>(AppConstants.archivedNoteBox);
    archivedNotes.clear();
    archivedNotes=_hive.box<Note>(AppConstants.archivedNoteBox).values.toList();
    emit(GetArchivedNotesSuccessState());
  }
}