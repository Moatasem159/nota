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
  @HiveField(3)
  int color;
  @HiveField(4)
  String imagePath;
  Note({required this.title, required this.note, required this.date,required this.color,required this.imagePath});
  bool isEmpty(){
   return title==''&&note==''&&imagePath==''?true:false;
  }
}