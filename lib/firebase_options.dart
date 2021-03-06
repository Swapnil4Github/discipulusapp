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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCRtwviwD7qVl6EDN8OD99uJX2RK4zk6cg',
    appId: '1:327660783278:web:0ce4ade28c993b0099cf3f',
    messagingSenderId: '327660783278',
    projectId: 'discipulus-d5885',
    authDomain: 'discipulus-d5885.firebaseapp.com',
    storageBucket: 'discipulus-d5885.appspot.com',
    measurementId: 'G-ER8VPE2K32',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6iwXfIJE3WAfVMw1W01RyMCwsGe6xQxY',
    appId: '1:327660783278:android:4836c6080560b40e99cf3f',
    messagingSenderId: '327660783278',
    projectId: 'discipulus-d5885',
    storageBucket: 'discipulus-d5885.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpwG4uZ_vVNhAeR2STu4qXHxqv5Ro-d7k',
    appId: '1:327660783278:ios:8b5584ab9543dc6399cf3f',
    messagingSenderId: '327660783278',
    projectId: 'discipulus-d5885',
    storageBucket: 'discipulus-d5885.appspot.com',
    androidClientId: '327660783278-ff12m1vmpord4c5k22hpr8vlps0dick6.apps.googleusercontent.com',
    iosClientId: '327660783278-7e3drt15bi743bctgtrvhgvacre8cb1n.apps.googleusercontent.com',
    iosBundleId: 'com.example.discipulus',
  );
}
