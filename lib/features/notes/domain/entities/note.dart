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
  @HiveField(5)
  bool pinned;
  Note({
    this.title="",
    this.note="",
    required this.date,
    required this.color,
    this.imagePath="",
    this.pinned=false,
  });
  bool isEmpty(){
   return title==''&&note==''&&imagePath==''?true:false;
  }
}