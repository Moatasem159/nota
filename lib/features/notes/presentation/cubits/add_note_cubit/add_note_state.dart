abstract class AddNoteStates {}
class AddNoteInitialState extends AddNoteStates {}
class AddNoteSuccessState extends AddNoteStates {
  final bool isAdded;
  AddNoteSuccessState(this.isAdded);
}
class AddNoteLoadingState extends AddNoteStates {}
class AddNoteErrorState extends AddNoteStates {}
class ChangeColorState extends AddNoteStates {}
class PickImageState extends AddNoteStates {}
class RemoveImageState extends AddNoteStates {}
