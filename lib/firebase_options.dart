// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJBR_Vc9w9IyjNpYZ9WkjlXjvF6bVwS80',
    appId: '1:382317455568:web:e42700e1bb1143777516d5',
    messagingSenderId: '382317455568',
    projectId: 'route-movies-app-81246',
    authDomain: 'route-movies-app-81246.firebaseapp.com',
    storageBucket: 'route-movies-app-81246.appspot.com',
    measurementId: 'G-XQ74GMGNE1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRTXcrOEpM6uN9BwD_JfPN_Njz6n60aEY',
    appId: '1:382317455568:android:1b4437d63f54f57b7516d5',
    messagingSenderId: '382317455568',
    projectId: 'route-movies-app-81246',
    storageBucket: 'route-movies-app-81246.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC05tJD6bpkaukwnlEnzVayL01tK92AHtA',
    appId: '1:382317455568:ios:05761a3011ae86b07516d5',
    messagingSenderId: '382317455568',
    projectId: 'route-movies-app-81246',
    storageBucket: 'route-movies-app-81246.appspot.com',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC05tJD6bpkaukwnlEnzVayL01tK92AHtA',
    appId: '1:382317455568:ios:05761a3011ae86b07516d5',
    messagingSenderId: '382317455568',
    projectId: 'route-movies-app-81246',
    storageBucket: 'route-movies-app-81246.appspot.com',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJBR_Vc9w9IyjNpYZ9WkjlXjvF6bVwS80',
    appId: '1:382317455568:web:ea22ac944e5bd72f7516d5',
    messagingSenderId: '382317455568',
    projectId: 'route-movies-app-81246',
    authDomain: 'route-movies-app-81246.firebaseapp.com',
    storageBucket: 'route-movies-app-81246.appspot.com',
    measurementId: 'G-F3QM1RNB7K',
  );

}