import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/features/notes/presentation/cubits/colors_bottom_sheet_cubit/colors_bottom_sheet_state.dart';
class ColorsBottomSheetCubit extends Cubit<ColorsBottomSheetStates> {
  ColorsBottomSheetCubit() : super(BottomSheetInitialState()){
    colors=[
      Colors.transparent,
      const Color(0xffA61D2E),
      const Color(0xff623F1B),
      const Color(0xff8d8f27),
      const Color(0xff207838),
      const Color(0xff2e2a6e),
      const Color(0xff514c8c),
      const Color(0xff571d46),
      const Color(0xff7a203a),
      const Color(0xff121111),
    ];
    chosen=[
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
  }
  late final List<Color> colors;
  late List<bool> chosen;
  chooseColor(int index){
   for(int i=0;i<chosen.length;i++){
     chosen[i] = false;
   }
    chosen[index]=true;
    emit(ChooseColorSuccessState());
  }
  initializeColor(int ?value){
    if(value!=null){
      int index=0;
      for (int i=0;i<colors.length;i++){
        if(colors[i].value==value){
          index = i;
          break;
        }
      }
      chooseColor(index);
    }
  }
}
