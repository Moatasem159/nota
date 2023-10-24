import 'dart:io';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:nota/core/functions/delete_image_file.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
  late String date;
  late int color;
  late File image;
  late String imagePath;
  late bool pinned;
  Future<void> addNote() async {
    emit(AddNoteLoadingState());
    Note note=Note(title: title.text, note: content.text, date: date,color: color,imagePath: imagePath,pinned: pinned);
    Either<dynamic, int> result = await _addNoteUsecase.call(note: note);
    emit(
      result.fold(
        (l) => AddNoteErrorState(),
        (r) => AddNoteSuccessState(r==-1?false:true),
      ),
    );
  }
  Future<void> editNote(Note note) async {
    bool edit=false;
    if (note.title != title.text){
      edit=true;
      note.title = title.text;
    }
    if (note.note != content.text) {
      edit=true;
      note.note = content.text;
    }
    if (note.color != color) {
      edit=true;
      note.color = color;
    }
    if(note.imagePath != imagePath) {
      edit=true;
      note.imagePath = imagePath;
    }
    if(note.pinned!=pinned)
      {
        edit=true;
        note.pinned = pinned;
      }
    if(note.isEmpty()){
      note.delete();
    }
    else {
    if (edit) {
        note.date=DateTime.now().toIso8601String();
        note.save();
      }
    }
  }
  changeColor(int value){
    color=value;
    emit(ChangeColorState());
  }
  changePinNote(){
    pinned=!pinned;
    emit(ChangePinNoteState());
  }
  Future<void> getImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source:isCamera? ImageSource.camera:ImageSource.gallery);
    if (xFile != null) {
      image = File(xFile.path);
      emit(PickImageState());
      await _saveImageToDocumentsDirectory(image,isCamera);
    }
  }
  Future<Uint8List> _imageFileToBytes(File imageFile) async {
    Uint8List bytes = await imageFile.readAsBytes();
    return bytes;
  }
  Future<void> _saveImageToDocumentsDirectory(File img,bool isCamera) async {
    final directory = await getApplicationDocumentsDirectory();
    String imageName = basename(img.path);
    imagePath = '${directory.path}/$imageName';
    if(isCamera)
      {
        XFile ?file=await compressImageFromCamera(image, imagePath);
        final File imageFile = File(file!.path);
        await imageFile.writeAsBytes(await _imageFileToBytes(imageFile));
      }
    else{
      final File imageFile = File(imagePath);
      await imageFile.writeAsBytes(await _imageFileToBytes(img));
    }

  }
  Future<XFile?> compressImageFromCamera(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, targetPath,
      quality: 50,
    );
    return result;
  }
  removeImage(){
    image=File("");
    emit(RemoveImageState());
    deleteImageFile(imagePath);
    imagePath='';
  }
}