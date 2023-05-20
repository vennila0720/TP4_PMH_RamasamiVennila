import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:541624448347:android:04891b608201b8c822567e',
        apiKey: 'AIzaSyDQL2x2TKXqJbUUTrj4BMApUjBxlQdxDJU',
        projectId: 'ecommerce-app-92545',
        messagingSenderId: '541624448347',
        iosBundleId: '',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:541624448347:android:04891b608201b8c822567e',
        apiKey: 'AIzaSyDQL2x2TKXqJbUUTrj4BMApUjBxlQdxDJU',
        projectId: 'ecommerce-app-92545',
        messagingSenderId: '541624448347',
      );
    }
  }
}
