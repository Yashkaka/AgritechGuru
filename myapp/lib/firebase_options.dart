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
    apiKey: 'AIzaSyCdvcEyXXiFegkFOZkHL8P48oRcl8J1Oys',
    appId: '1:1018305899258:web:f1af052e2f87c8e5d33743',
    messagingSenderId: '1018305899258',
    projectId: 'agriculture-a4bfa',
    authDomain: 'agriculture-a4bfa.firebaseapp.com',
    storageBucket: 'agriculture-a4bfa.appspot.com',
    measurementId: 'G-WN3SDWCVZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_uOzjvP9FLxJrqNAsxuIQvrjwIaiTPzk',
    appId: '1:1018305899258:android:e389eda64f9746e7d33743',
    messagingSenderId: '1018305899258',
    projectId: 'agriculture-a4bfa',
    storageBucket: 'agriculture-a4bfa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfzyp66bTJhw-CSnrjl7I6l-kqv3MGSCo',
    appId: '1:1018305899258:ios:6235273b220e0e29d33743',
    messagingSenderId: '1018305899258',
    projectId: 'agriculture-a4bfa',
    storageBucket: 'agriculture-a4bfa.appspot.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfzyp66bTJhw-CSnrjl7I6l-kqv3MGSCo',
    appId: '1:1018305899258:ios:a25019e750e1b431d33743',
    messagingSenderId: '1018305899258',
    projectId: 'agriculture-a4bfa',
    storageBucket: 'agriculture-a4bfa.appspot.com',
    iosBundleId: 'com.example.myapp.RunnerTests',
  );
}
