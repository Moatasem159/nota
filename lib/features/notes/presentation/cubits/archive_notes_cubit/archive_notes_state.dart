abstract class ArchiveNotesStates {}
class ArchiveNotesInitialState extends ArchiveNotesStates {}
class ArchiveNoteSuccessState extends ArchiveNotesStates {
  final bool inArchivedScreen;
  ArchiveNoteSuccessState({this.inArchivedScreen=false});
}
class ArchiveNoteLoadingState extends ArchiveNotesStates {}
class ArchiveNoteErrorState extends ArchiveNotesStates {}