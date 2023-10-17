import 'package:hydrated_bloc/hydrated_bloc.dart';
class ChangeListViewCubit extends HydratedCubit<bool> {
  ChangeListViewCubit():super(true);
  _getListView(){
    emit(false);
  }
  _getGridView(){
    emit(true);
  }
  changeView(){
    if(state){
      _getListView();
    }
    else{
      _getGridView();
    }
  }
  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json["isGrid"]=="true"?true:false;
  }
  @override
  Map<String, dynamic>? toJson(bool state) {
    return state==true? {"isGrid": "true"}: {"isGrid": "false"};
  }
}