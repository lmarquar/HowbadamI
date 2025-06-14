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
    apiKey: 'AIzaSyCSsuDIGvJV4pE6VOZdnNDmWaghq7-Xq78',
    appId: '1:1073845152536:web:94a7fa14135ea78b2a0c6d',
    messagingSenderId: '1073845152536',
    projectId: 'howbadami-12335',
    authDomain: 'howbadami-12335.firebaseapp.com',
    storageBucket: 'howbadami-12335.firebasestorage.app',
    measurementId: 'G-WXQY8L1048',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALv2bx999ABwZr23pG8ckOe3EufnkSi54',
    appId: '1:1073845152536:android:9a5aef704ff4aa082a0c6d',
    messagingSenderId: '1073845152536',
    projectId: 'howbadami-12335',
    storageBucket: 'howbadami-12335.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgwVG2qjxM34nuNKdqysSvNIhWnFl49Y8',
    appId: '1:1073845152536:ios:a94e8e136d97843c2a0c6d',
    messagingSenderId: '1073845152536',
    projectId: 'howbadami-12335',
    storageBucket: 'howbadami-12335.firebasestorage.app',
    androidClientId: '1073845152536-4os4nqvk49sfpq2o9ldbi8mphq9f2dbv.apps.googleusercontent.com',
    iosClientId: '1073845152536-i6poj2dhh59p2hftk6taurdiscu8edek.apps.googleusercontent.com',
    iosBundleId: 'com.example.howbadami',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgwVG2qjxM34nuNKdqysSvNIhWnFl49Y8',
    appId: '1:1073845152536:ios:a94e8e136d97843c2a0c6d',
    messagingSenderId: '1073845152536',
    projectId: 'howbadami-12335',
    storageBucket: 'howbadami-12335.firebasestorage.app',
    androidClientId: '1073845152536-4os4nqvk49sfpq2o9ldbi8mphq9f2dbv.apps.googleusercontent.com',
    iosClientId: '1073845152536-i6poj2dhh59p2hftk6taurdiscu8edek.apps.googleusercontent.com',
    iosBundleId: 'com.example.howbadami',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCSsuDIGvJV4pE6VOZdnNDmWaghq7-Xq78',
    appId: '1:1073845152536:web:80287e601bebca932a0c6d',
    messagingSenderId: '1073845152536',
    projectId: 'howbadami-12335',
    authDomain: 'howbadami-12335.firebaseapp.com',
    storageBucket: 'howbadami-12335.firebasestorage.app',
    measurementId: 'G-PETPZWTEPV',
  );

}