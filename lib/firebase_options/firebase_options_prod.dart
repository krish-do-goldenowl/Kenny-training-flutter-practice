// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:myapp/src/utils/helper/get_env.dart'; // Import the helper function

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_stg.dart';
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

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: getEnv('API_KEY_WEB'),
    appId: getEnv('APP_ID_WEB'),
    messagingSenderId: getEnv('MESSAGING_SENDER_ID'),
    projectId: getEnv('PROJECT_ID'),
    authDomain: getEnv('AUTH_DOMAIN'),
    databaseURL: getEnv('DATABASE_URL'),
    storageBucket: getEnv('STORAGE_BUCKET'),
    measurementId: getEnv('MEASUREMENT_ID'),
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: getEnv('API_KEY_ANDROID'),
    appId: getEnv('APP_ID_ANDROID'),
    messagingSenderId: getEnv('MESSAGING_SENDER_ID'),
    projectId: getEnv('PROJECT_ID'),
    databaseURL: getEnv('DATABASE_URL'),
    storageBucket: getEnv('STORAGE_BUCKET'),
    androidClientId: getEnv('ANDROID_CLIENT_ID'),
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: getEnv('API_KEY_IOS'),
    appId: getEnv('APP_ID_IOS'),
    messagingSenderId: getEnv('MESSAGING_SENDER_ID'),
    projectId: getEnv('PROJECT_ID'),
    databaseURL: getEnv('DATABASE_URL'),
    storageBucket: getEnv('STORAGE_BUCKET'),
    iosClientId: getEnv('IOS_CLIENT_ID'),
    iosBundleId: getEnv('IOS_BUNDLE_ID'),
  );
}
