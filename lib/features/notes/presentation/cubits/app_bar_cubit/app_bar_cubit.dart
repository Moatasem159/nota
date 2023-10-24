import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/core/functions/delete_image_file.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
class AppBarCubit extends Cubit<AppBarStates> {
  AppBarCubit() : super(AppBarInitialState()){
    isBase=true;
    isPinned=false;
    selectedNotes=[];
  }
  late bool isBase;
  late bool isPinned;
  late List<Note> selectedNotes;
  showOptionAppBar(){
    if(selectedNotes.length==1){
      isBase=false;
    }
  }
  hideOptionAppBar(){
    if(selectedNotes.isEmpty){
      isBase=true;
    }
  }
  _selectNotes(Note note){
    selectedNotes.add(note);
  }
  _unselectNotes(Note note){
    selectedNotes.remove(note);
  }
  selectNotes(Note note){
    if(selectedNotes.contains(note))
    {
      _unselectNotes(note);
      if(selectedNotes.isEmpty)
      {
        isPinned = false;
      }
      hideOptionAppBar();
    }
    else{
      _selectNotes(note);
       showOptionAppBar();
    }
    _changeIsPinned();
    emit(SelectNoteState());
  }
  removeSelection(){
    selectedNotes.clear();
    isBase=true;
    isPinned=true;
    emit(RemoveSelectionState());
  }
  deleteNotes(){
    for (var element in selectedNotes){
      if(element.imagePath!=""){
        deleteImageFile(element.imagePath);
      }
      element.delete();
    }
    selectedNotes.clear();
    hideOptionAppBar();
    emit(DeleteNotesSuccessState());
  }
  pinNotes(){
    for (var element in selectedNotes){
      if(isPinned)
        {
          if(element.pinned==true){
            element.pinned=false;
            element.save();
          }
        }
      else{
        if(element.pinned==false){
          element.pinned=true;
          element.save();
        }
      }
    }
    selectedNotes.clear();
    isPinned=false;
    hideOptionAppBar();
    emit(PinNotesSuccessState());
  }
  _changeIsPinned(){
    for (var element in selectedNotes) {
        if(!element.pinned)
        {
          isPinned = false;
          break;
        }
        else{
          isPinned = true;
        }
      }
    }
  }