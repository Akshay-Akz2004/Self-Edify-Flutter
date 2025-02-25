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
    apiKey: 'AIzaSyBKSRnl7Q_8VXCJRXv9ex7cyykVSdv8J6w',
    appId: '1:552838762260:web:08d57d79efbb813da0fc01',
    messagingSenderId: '552838762260',
    projectId: 'selfedify-5469c',
    authDomain: 'selfedify-5469c.firebaseapp.com',
    storageBucket: 'selfedify-5469c.appspot.com',
    measurementId: 'G-04KR34BZQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAU4ylFlnBbizcPbAYDeNrpJU_RkEO0qrM',
    appId: '1:552838762260:android:4d399c29bf3cd36da0fc01',
    messagingSenderId: '552838762260',
    projectId: 'selfedify-5469c',
    storageBucket: 'selfedify-5469c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9P3cJyAfHt1Tl9Ynu5b795enAp0TqVRM',
    appId: '1:552838762260:ios:f937491528729e95a0fc01',
    messagingSenderId: '552838762260',
    projectId: 'selfedify-5469c',
    storageBucket: 'selfedify-5469c.appspot.com',
    iosBundleId: 'com.example.selfEdify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9P3cJyAfHt1Tl9Ynu5b795enAp0TqVRM',
    appId: '1:552838762260:ios:b80b5e48ffa18734a0fc01',
    messagingSenderId: '552838762260',
    projectId: 'selfedify-5469c',
    storageBucket: 'selfedify-5469c.appspot.com',
    iosBundleId: 'com.example.selfEdify.RunnerTests',
  );
}
