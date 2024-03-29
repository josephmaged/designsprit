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
    apiKey: 'AIzaSyDBGFnInQEarkgZW0HEkdzZbw1hzSQCQVs',
    appId: '1:160484421125:android:354f51b7d27dc104dcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    storageBucket: 'construction-95d49.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAta9Sk0Ew119Jokn-YojQe0xYOOLzrox8',
    appId: '1:160484421125:ios:3f9f8ed181d1ade1dcb66c',
    messagingSenderId: '160484421125',
    projectId: 'construction-95d49',
    storageBucket: 'construction-95d49.appspot.com',
    androidClientId: '160484421125-jash4lgb0k01vi47pl6bnjktt384lccc.apps.googleusercontent.com',
    iosClientId: '160484421125-1j8an2h8po5er5354334bkm2m72qhd6n.apps.googleusercontent.com',
    iosBundleId: 'com.integrated.designsprit',
  );
}
