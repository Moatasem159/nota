import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/app.dart';
import 'package:nota/app/bloc_observer.dart';
import 'package:nota/app/injection_container.dart'as di show init;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  if(kDebugMode) {
    Bloc.observer=AppBlocObserver();
  }
  runApp(const Nota());
}