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
    apiKey: 'AIzaSyAHszUqGyg5mlSPklWMLW9o9dRj1L4NOgo',
    appId: '1:615406811204:web:c283a1748607f726192411',
    messagingSenderId: '615406811204',
    projectId: 'store-memories-app-50b41',
    authDomain: 'store-memories-app-50b41.firebaseapp.com',
    storageBucket: 'store-memories-app-50b41.appspot.com',
    measurementId: 'G-314VGWHVEW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAuNSWiQelQni7G9pCf2k-6HzKqfW6rftY',
    appId: '1:615406811204:android:7edb7c2babc5997e192411',
    messagingSenderId: '615406811204',
    projectId: 'store-memories-app-50b41',
    storageBucket: 'store-memories-app-50b41.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGmGB0HgPaqgBGqFkiqcNu90k9yWZuWME',
    appId: '1:615406811204:ios:c085e138f582e97c192411',
    messagingSenderId: '615406811204',
    projectId: 'store-memories-app-50b41',
    storageBucket: 'store-memories-app-50b41.appspot.com',
    iosBundleId: 'com.example.storeMemories',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGmGB0HgPaqgBGqFkiqcNu90k9yWZuWME',
    appId: '1:615406811204:ios:c085e138f582e97c192411',
    messagingSenderId: '615406811204',
    projectId: 'store-memories-app-50b41',
    storageBucket: 'store-memories-app-50b41.appspot.com',
    iosBundleId: 'com.example.storeMemories',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHszUqGyg5mlSPklWMLW9o9dRj1L4NOgo',
    appId: '1:615406811204:web:6bc490551f4167ac192411',
    messagingSenderId: '615406811204',
    projectId: 'store-memories-app-50b41',
    authDomain: 'store-memories-app-50b41.firebaseapp.com',
    storageBucket: 'store-memories-app-50b41.appspot.com',
    measurementId: 'G-0GRRBNKEKW',
  );
}
