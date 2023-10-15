import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/core/utils/app_constants.dart';
import 'package:nota/features/notes/data/datasources/note_local_data_source.dart';
import 'package:nota/features/notes/data/repositories/note_repository_impl.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
import 'package:nota/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:path_provider/path_provider.dart';
final sl = GetIt.instance;
Future<void> init() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(AppConstants.noteBox);
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  sl.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSourceImpl());
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));
  sl.registerLazySingleton<AddNoteUsecase>(() => AddNoteUsecase(sl()));
}