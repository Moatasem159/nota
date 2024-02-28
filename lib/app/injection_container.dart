import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/core/database/hive_consumer.dart';
import 'package:nota/core/database/hive_manager.dart';
import 'package:nota/features/notes/data/datasources/note_local_data_source.dart';
import 'package:nota/features/notes/data/repositories/note_repository_impl.dart';
import 'package:nota/features/notes/domain/entities/note.dart';
import 'package:nota/features/notes/domain/repositories/note_repository.dart';
import 'package:nota/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:nota/features/notes/domain/usecases/archive_note_usecase.dart';
import 'package:nota/features/notes/domain/usecases/delete_note_use_case.dart';
import 'package:path_provider/path_provider.dart';
final sl = GetIt.instance;
Future<void> init() async{
  await _iniHive();
  await _registerAdapters();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  sl.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));
  sl.registerLazySingleton<AddNoteUsecase>(() => AddNoteUsecase(sl()));
  sl.registerLazySingleton<ArchiveNoteUsecase>(() => ArchiveNoteUsecase(sl()));
  sl.registerLazySingleton<DeleteNoteUsecase>(() => DeleteNoteUsecase(sl()));
}
_iniHive()async{
  await Hive.initFlutter();
  sl.registerLazySingleton(() =>Hive);

  sl.registerLazySingleton<HiveConsumer>(() => HiveManager(sl()));
}
_registerAdapters()async {
  HiveConsumer hive=HiveManager(sl());
  hive.registerAdapter(NoteAdapter());
}