import 'package:flutter/material.dart';
import 'package:nota/app/app.dart';
import 'package:nota/app/injection_container.dart'as di show init;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const Nota());
}