import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
          apiKey: "AIzaSyBZxZbVDWSBGOa-MDyamLjiNO-8nbtNqtE",
          authDomain: "flutter-project-b1202.firebaseapp.com",
          projectId: "flutter-project-b1202",
          storageBucket: "flutter-project-b1202.appspot.com",
          messagingSenderId: "906655448771",
          appId: "1:906655448771:web:87b469c7f9bc7ae8cf2c76");
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }
}
