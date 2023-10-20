import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/bottom_bar_cubit/bottom_bar_state.dart';
class BottomBarCubit extends Cubit<BottomBarStates> {
  BottomBarCubit() : super(BottomBarInitialState()){
    showStyleBar=false;
    focusNode=FocusNode()..addListener(_focusNodeListener);
  }
  late FocusNode focusNode;
  late bool showStyleBar;
  void _focusNodeListener(){
    if(focusNode.hasFocus)
      {
        showStyleBar=true;
      }
    else{
      showStyleBar=false;
    }

    emit(ShowTextStyleBottomBarState());
  }
  showBottomStyleBar(){
    emit(OpenTextStyleBottomBarState());
  }
  hideBottomStyleBar(){
    emit(BottomBarInitialState());
  }

  @override
  Future<void> close() {
    focusNode.removeListener(_focusNodeListener);
    return super.close();
  }
}