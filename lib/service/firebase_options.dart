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
    apiKey: 'AIzaSyBVI6oHks7E_PBCTdlFIyAslDLgBRswWzE',
    appId: '1:614104786728:web:e6e6d139b697f544be521d',
    messagingSenderId: '614104786728',
    projectId: 'to-do-list-b0675',
    authDomain: 'to-do-list-b0675.firebaseapp.com',
    storageBucket: 'to-do-list-b0675.firebasestorage.app',
    measurementId: 'G-GF0BZ6XMF6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZa6xMWGp3yYPemuJ9aYZuCJENwvPC-NA',
    appId: '1:614104786728:android:019e57057e3f05c4be521d',
    messagingSenderId: '614104786728',
    projectId: 'to-do-list-b0675',
    storageBucket: 'to-do-list-b0675.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDx3dkfIp2s5PBGONKmZoqYUZ0hWLfrrJA',
    appId: '1:614104786728:ios:9a08f65b12d123cdbe521d',
    messagingSenderId: '614104786728',
    projectId: 'to-do-list-b0675',
    storageBucket: 'to-do-list-b0675.firebasestorage.app',
    iosBundleId: 'com.example.baseTodolist',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDx3dkfIp2s5PBGONKmZoqYUZ0hWLfrrJA',
    appId: '1:614104786728:ios:9a08f65b12d123cdbe521d',
    messagingSenderId: '614104786728',
    projectId: 'to-do-list-b0675',
    storageBucket: 'to-do-list-b0675.firebasestorage.app',
    iosBundleId: 'com.example.baseTodolist',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBVI6oHks7E_PBCTdlFIyAslDLgBRswWzE',
    appId: '1:614104786728:web:255df6b75a8ae6eebe521d',
    messagingSenderId: '614104786728',
    projectId: 'to-do-list-b0675',
    authDomain: 'to-do-list-b0675.firebaseapp.com',
    storageBucket: 'to-do-list-b0675.firebasestorage.app',
    measurementId: 'G-E6X36JC51E',
  );
}
