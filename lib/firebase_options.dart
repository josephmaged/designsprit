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
    apiKey: 'AIzaSyAUcgf3xys2B_DhcBF8bBEU5MTeyF6lHQk',
    appId: '1:160484421125:web:8cfb4e199bde060fdcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    authDomain: 'construction-95d49.firebaseapp.com',
    storageBucket: 'construction-95d49.appspot.com',
    measurementId: 'G-EXVVDGNNTG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBGFnInQEarkgZW0HEkdzZbw1hzSQCQVs',
    appId: '1:160484421125:android:c800ffc5eb02bbe4dcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    storageBucket: 'construction-95d49.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAta9Sk0Ew119Jokn-YojQe0xYOOLzrox8',
    appId: '1:160484421125:ios:52453c0f22dfaacedcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    storageBucket: 'construction-95d49.appspot.com',
    androidClientId: '160484421125-jash4lgb0k01vi47pl6bnjktt384lccc.apps.googleusercontent.com',
    iosClientId: '160484421125-6js0tkktc1gufvcplh8l5f6ou2471nmq.apps.googleusercontent.com',
    iosBundleId: 'com.integrated.designSprit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAta9Sk0Ew119Jokn-YojQe0xYOOLzrox8',
    appId: '1:160484421125:ios:52453c0f22dfaacedcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    storageBucket: 'construction-95d49.appspot.com',
    androidClientId: '160484421125-jash4lgb0k01vi47pl6bnjktt384lccc.apps.googleusercontent.com',
    iosClientId: '160484421125-6js0tkktc1gufvcplh8l5f6ou2471nmq.apps.googleusercontent.com',
    iosBundleId: 'com.integrated.designSprit',
  );
}
