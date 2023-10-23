import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/core/functions/delete_image_file.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/presentation/cubits/app_bar_cubit/app_bar_state.dart';
class AppBarCubit extends Cubit<AppBarStates> {
  AppBarCubit() : super(AppBarInitialState()){
    isBase=true;
    selectedNotes=[];
  }
  late bool isBase;
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
      hideOptionAppBar();
    }
    else{
      _selectNotes(note);
       showOptionAppBar();
    }
    emit(SelectNoteState());
  }
  removeSelection(){
    selectedNotes.clear();
    isBase=true;
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
}
