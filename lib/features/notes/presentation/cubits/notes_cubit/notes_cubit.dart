import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/notes_cubit/notes_state.dart';
class NotesCubit extends Cubit<NotesStates>{
  NotesCubit() : super(GetNotesInitialState());
  List<Note> notes=[];
  getNotes(){
    notes=Hive.box<Note>(AppConstants.noteBox).values.toList();
    emit(GetNotesSuccessState());
  }
}