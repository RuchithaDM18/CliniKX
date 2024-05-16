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
    apiKey: 'AIzaSyAV_ecTr_AeRkLVEReIpXyFmVAzH_81QvQ',
    appId: '1:65822503237:web:6edc76cadda205f3e70e2c',
    messagingSenderId: '65822503237',
    projectId: 'clinikx-b1b1e',
    authDomain: 'clinikx-b1b1e.firebaseapp.com',
    storageBucket: 'clinikx-b1b1e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKJhlniLkcFBxyLbqKMRBFkMput3VLL2Q',
    appId: '1:65822503237:android:42ae7ce69bd2f9e4e70e2c',
    messagingSenderId: '65822503237',
    projectId: 'clinikx-b1b1e',
    storageBucket: 'clinikx-b1b1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcp4IYQEinIBSMSUBwAUb8XOltrvzUXm4',
    appId: '1:65822503237:ios:3ce0e9abba15a862e70e2c',
    messagingSenderId: '65822503237',
    projectId: 'clinikx-b1b1e',
    storageBucket: 'clinikx-b1b1e.appspot.com',
    iosBundleId: 'com.example.clinikx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcp4IYQEinIBSMSUBwAUb8XOltrvzUXm4',
    appId: '1:65822503237:ios:4820c9c256b07f11e70e2c',
    messagingSenderId: '65822503237',
    projectId: 'clinikx-b1b1e',
    storageBucket: 'clinikx-b1b1e.appspot.com',
    iosBundleId: 'com.example.clinikx.RunnerTests',
  );
}