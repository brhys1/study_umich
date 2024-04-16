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
    apiKey: 'AIzaSyCdfnMB0yXVerDiYeGhKxxtdtBXBPay4EY',
    appId: '1:343128889726:web:c4f3ab4d9148100356fb2f',
    messagingSenderId: '343128889726',
    projectId: 'ktp-study',
    authDomain: 'ktp-study.firebaseapp.com',
    databaseURL: 'https://ktp-study-default-rtdb.firebaseio.com',
    storageBucket: 'ktp-study.appspot.com',
    measurementId: 'G-QG3JTF6455',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh0k6DWlvQRyeneMmIbMyJ_ekL-t-KPcw',
    appId: '1:343128889726:android:5569c4b6f4e224b556fb2f',
    messagingSenderId: '343128889726',
    projectId: 'ktp-study',
    databaseURL: 'https://ktp-study-default-rtdb.firebaseio.com',
    storageBucket: 'ktp-study.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD0UzWC5JJSSejZ9LWGvs9cfSPnCj3oYE',
    appId: '1:343128889726:ios:5f053d89ccfd77f656fb2f',
    messagingSenderId: '343128889726',
    projectId: 'ktp-study',
    databaseURL: 'https://ktp-study-default-rtdb.firebaseio.com',
    storageBucket: 'ktp-study.appspot.com',
    iosBundleId: 'com.example.umichStudy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDD0UzWC5JJSSejZ9LWGvs9cfSPnCj3oYE',
    appId: '1:343128889726:ios:5f053d89ccfd77f656fb2f',
    messagingSenderId: '343128889726',
    projectId: 'ktp-study',
    databaseURL: 'https://ktp-study-default-rtdb.firebaseio.com',
    storageBucket: 'ktp-study.appspot.com',
    iosBundleId: 'com.example.umichStudy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdfnMB0yXVerDiYeGhKxxtdtBXBPay4EY',
    appId: '1:343128889726:web:3b373a6a30560aeb56fb2f',
    messagingSenderId: '343128889726',
    projectId: 'ktp-study',
    authDomain: 'ktp-study.firebaseapp.com',
    databaseURL: 'https://ktp-study-default-rtdb.firebaseio.com',
    storageBucket: 'ktp-study.appspot.com',
    measurementId: 'G-GYPY56NNFX',
  );

}