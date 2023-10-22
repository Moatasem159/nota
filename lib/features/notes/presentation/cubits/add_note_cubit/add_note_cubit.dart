import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:nota/features/notes/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class AddNoteCubit extends Cubit<AddNoteStates> {
  final AddNoteUsecase _addNoteUsecase;
  AddNoteCubit(this._addNoteUsecase) : super(AddNoteInitialState()){
    title=TextEditingController();
    content=TextEditingController();
  }
  late TextEditingController title;
  late TextEditingController content;
  late int color;
  late File image;
  late String imagePath;
  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    Note note=Note(title: title.text, note: content.text, date: DateTime.now().toIso8601String(),color: color,imagePath: imagePath);
    Either<dynamic, int> result = await _addNoteUsecase.call(note: note);
    emit(
      result.fold(
        (l) => AddNoteErrorState(),
        (r) => AddNoteSuccessState(r==-1?false:true),
      ),
    );
  }
  Future<void> editNote(Note note) async {
    if (note.title != title.text) {
      note.title = title.text;
    }
    if (note.note != content.text) {
      note.note = content.text;
    }
    if (note.color != color) {
      note.color = color;
    }
    if(note.imagePath != imagePath) {
      note.imagePath = imagePath;
    }
    if(note.isEmpty()){
      note.delete();
    }
    else{
      note.save();
    }
  }
  changeColor(int value){
    color=value;
    emit(ChangeColorState());
  }
  Future<void> getImageFromGallery(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source:isCamera? ImageSource.camera:ImageSource.gallery);
    if (xFile != null) {
      image = File(xFile.path);
    }
    emit(PickImageState());
    await _saveImageToDocumentsDirectory(
        await _imageFileToBytes(image), image.path);
  }
  Future<Uint8List> _imageFileToBytes(File imageFile) async {
    Uint8List bytes = await imageFile.readAsBytes();
    return bytes;
  }
  Future<void> _saveImageToDocumentsDirectory(Uint8List imageBytes, String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    String imageName = basename(filename);
    imagePath = '${directory.path}/$imageName';
    final File imageFile = File(imagePath);
    await imageFile.writeAsBytes(imageBytes);
  }
  void _deleteImageFile(String filePath) {
    File imageFile = File(filePath);
    if (imageFile.existsSync()) {
      imageFile.deleteSync();
      imagePath='';
    }
  }
  removeImage(){
    image=File("");
    emit(RemoveImageState());
    _deleteImageFile(imagePath);
  }
}