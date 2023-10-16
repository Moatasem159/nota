import 'package:hive_flutter/hive_flutter.dart';
part 'note.g.dart';
@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  String date;
  Note({required this.title, required this.note, required this.date});
  bool isEmpty(){
   return title==''&&note==''?true:false;
  }
}