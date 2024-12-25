// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBP7rn_4PRfGA9ll58GEYYnaHwclG8u608',
    appId: '1:919228162217:web:5b2646b5d64e52636a89b8',
    messagingSenderId: '919228162217',
    projectId: 'foodie-4ae69',
    authDomain: 'foodie-4ae69.firebaseapp.com',
    storageBucket: 'foodie-4ae69.firebasestorage.app',
    measurementId: 'G-CV1XJS46FF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhvhAxPX4zXbAfvwkaYofQiuJ-voqlwWM',
    appId: '1:919228162217:android:b04987de75594e9f6a89b8',
    messagingSenderId: '919228162217',
    projectId: 'foodie-4ae69',
    storageBucket: 'foodie-4ae69.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSaLmIDcZMVeElQWdi-htlgEdmSMYsEQ8',
    appId: '1:919228162217:ios:00fac4aa56d924fd6a89b8',
    messagingSenderId: '919228162217',
    projectId: 'foodie-4ae69',
    storageBucket: 'foodie-4ae69.firebasestorage.app',
    iosBundleId: 'com.example.foodie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSaLmIDcZMVeElQWdi-htlgEdmSMYsEQ8',
    appId: '1:919228162217:ios:00fac4aa56d924fd6a89b8',
    messagingSenderId: '919228162217',
    projectId: 'foodie-4ae69',
    storageBucket: 'foodie-4ae69.firebasestorage.app',
    iosBundleId: 'com.example.foodie',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBP7rn_4PRfGA9ll58GEYYnaHwclG8u608',
    appId: '1:919228162217:web:734b0051fbc8e81b6a89b8',
    messagingSenderId: '919228162217',
    projectId: 'foodie-4ae69',
    authDomain: 'foodie-4ae69.firebaseapp.com',
    storageBucket: 'foodie-4ae69.firebasestorage.app',
    measurementId: 'G-JYXCGSRNB8',
  );
}