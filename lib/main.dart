import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'core/my_bloc_observer.dart';
import 'my_app.dart';

void main() {
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}
