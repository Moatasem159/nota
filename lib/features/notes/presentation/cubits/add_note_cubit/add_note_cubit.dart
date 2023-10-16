import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
class AddNoteCubit extends Cubit<AddNoteStates> {
  final AddNoteUsecase _addNoteUsecase;
  AddNoteCubit(this._addNoteUsecase) : super(AddNoteInitialState()){
    title=TextEditingController();
    content=TextEditingController();
  }
  late TextEditingController title;
  late TextEditingController content;
  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    Note note=Note(title: title.text, note: content.text, date: DateTime.now().toIso8601String());
    Either<dynamic, int> result = await _addNoteUsecase.call(note: note);
    emit(
      result.fold(
        (l) => AddNoteErrorState(),
        (r) => AddNoteSuccessState(r==-1?false:true),
      ),
    );
  }
  Future<void> editNote(Note note)async{
    note.title=title.text;
    note.note=content.text;
    note.save();
  }
}