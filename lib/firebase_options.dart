// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_sandbox.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8vcpFvAFF50xRXpI86sFj2-iYIdqeeyI',
    appId: '1:271438279507:android:d1afe3a7653146c2b7a7a6',
    messagingSenderId: '271438279507',
    projectId: "sign-in-flutter-421806",
    storageBucket: "sign-in-flutter-421806.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7t5yFFkyL9jveh3dWLYe4L7wU3cEpJJI',
    appId: '1:518370131460:ios:695e7c5fa2f415c1813f51',
    messagingSenderId: '518370131460',
    projectId: "sawera-prod-1",
    // storageBucket: "sawera-prod-1.appspot.com",
    // iosClientId:
    //     '518370131460-mvvrbpcml906s7tqbno38r9k181m3t6m.apps.googleusercontent.com',
    // iosBundleId: 'ch.SaweraGmbH.Sawera',
  );
}
