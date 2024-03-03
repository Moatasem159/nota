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
  String boxName;
  @HiveField(6)
  bool pinned;
  Note({
    this.title="",
    this.note="",
    required this.date,
    required this.color,
    required this.boxName,
    this.imagePath="",
    this.pinned=false,
  });
  bool isEmpty(){
   return title==''&&note==''&&imagePath==''?true:false;
  }
}
enum NoteType{
  home,archive,delete
}