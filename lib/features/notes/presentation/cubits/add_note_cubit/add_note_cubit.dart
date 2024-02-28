import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/image/image_helper.dart';
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
  late Note note;
  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    note.title=title.text;
    note.note=content.text;
    Either<dynamic, int> result = await _addNoteUsecase(note: note);
    emit(
      result.fold(
        (l) => AddNoteErrorState(),
        (r) => AddNoteSuccessState(r==-1?false:true),
      ),
    );
  }
  Future<void> editNote(Note noteModel) async {
    bool edit=false;
    if (noteModel.title != title.text){
      edit=true;
      noteModel.title = title.text;
    }
    if (noteModel.note != content.text) {
      edit=true;
      noteModel.note = content.text;
    }
    if (noteModel.color != note.color) {
      edit=true;
      noteModel.color = note.color;
    }
    if(noteModel.imagePath != note.imagePath) {
      edit=true;
      noteModel.imagePath = note.imagePath;
    }
    if(noteModel.pinned!=note.pinned)
      {
        edit=true;
        noteModel.pinned = note.pinned;
      }
    if(noteModel.isEmpty()){
      noteModel.delete();
    }
    else {
    if (edit) {
        noteModel.date=DateTime.now().toIso8601String();
        noteModel.save();
      }
    }
  }
  changeColor(int value){
    note.color=value;
    emit(ChangeColorState());
  }
  changePinNote(){
    note.pinned=!note.pinned;
    emit(ChangePinNoteState());
  }
  Future<void> getImage(bool isCamera) async {
    note.imagePath=await ImageHelper.pickImage(isCamera);
    emit(PickImageState());
  }
  removeImage(){
    ImageHelper.deleteImageFile(note.imagePath);
    note.imagePath='';
    emit(RemoveImageState());
  }
}