import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:provider/provider.dart';
import 'core/firebase/providers/auth_provider.dart';
import 'core/my_bloc_observer.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProviders()),
      ],
      child: const MyApp(),
    ),
  );
}
