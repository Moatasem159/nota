import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
final sl = GetIt.instance;
Future<void> init() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(AppConstants.noteBox);
}