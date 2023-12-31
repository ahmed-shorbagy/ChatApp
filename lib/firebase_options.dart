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
    apiKey: 'AIzaSyD0LmKMRAa3SUVrz8potGkt4PFQu6x3k5U',
    appId: '1:48071672287:web:daf4ec1cf885f42676846a',
    messagingSenderId: '48071672287',
    projectId: 'chat-app2-336bc',
    authDomain: 'chat-app2-336bc.firebaseapp.com',
    storageBucket: 'chat-app2-336bc.appspot.com',
    measurementId: 'G-CHSTX0WGRF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmEvtKX3Dc7YyVBAVG-Z3V-2HOv6bhS2k',
    appId: '1:48071672287:android:64d1c2512fd43bcd76846a',
    messagingSenderId: '48071672287',
    projectId: 'chat-app2-336bc',
    storageBucket: 'chat-app2-336bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb7LumvnIV3FHjTBytsjDbjzP-EeRN8jc',
    appId: '1:48071672287:ios:578076f10d362e1a76846a',
    messagingSenderId: '48071672287',
    projectId: 'chat-app2-336bc',
    storageBucket: 'chat-app2-336bc.appspot.com',
    iosClientId: '48071672287-5gkr32r8gjfghddd3o0371gs110kkoa5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDb7LumvnIV3FHjTBytsjDbjzP-EeRN8jc',
    appId: '1:48071672287:ios:9e9c3c18a22b296776846a',
    messagingSenderId: '48071672287',
    projectId: 'chat-app2-336bc',
    storageBucket: 'chat-app2-336bc.appspot.com',
    iosClientId: '48071672287-7cl2pttmuvdtabc4279a69v14n5jlvr5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp2.RunnerTests',
  );
}
