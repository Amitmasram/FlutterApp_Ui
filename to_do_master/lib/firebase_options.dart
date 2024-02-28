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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCGD7Mfu_soSAierklU97HDz00CL1nCvig',
    appId: '1:473303209845:web:eebab6633986cbd11e653c',
    messagingSenderId: '473303209845',
    projectId: 'to-do-f79c8',
    authDomain: 'to-do-f79c8.firebaseapp.com',
    storageBucket: 'to-do-f79c8.appspot.com',
    measurementId: 'G-4VVMVMRJM0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDavnYBSfkhDeET_tC17_vJKt2JpJOJV2w',
    appId: '1:473303209845:android:ebc71bed814d799e1e653c',
    messagingSenderId: '473303209845',
    projectId: 'to-do-f79c8',
    storageBucket: 'to-do-f79c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVDhXis2DF-Qipt3C2trCIxq6_COca7pg',
    appId: '1:473303209845:ios:32f30e5f1faeff1f1e653c',
    messagingSenderId: '473303209845',
    projectId: 'to-do-f79c8',
    storageBucket: 'to-do-f79c8.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVDhXis2DF-Qipt3C2trCIxq6_COca7pg',
    appId: '1:473303209845:ios:147b55f2618332de1e653c',
    messagingSenderId: '473303209845',
    projectId: 'to-do-f79c8',
    storageBucket: 'to-do-f79c8.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
