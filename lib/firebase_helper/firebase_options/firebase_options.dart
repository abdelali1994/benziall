import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        // تكوين القيم الافتراضية لتطبيق Android
        appId: '1:210745451706:ios:fed34f1f09529999334e83',
        apiKey: 'AIzaSyATs4gWMyPVQUly5VUB6_3YQ4n3me90bvI',
        projectId: 'benzi-all',
        messagingSenderId: '210745451706',
        iosBundleId: 'com.example.ecommerceWithAdminPanel',
      );
    } else {
      // Android
      return const FirebaseOptions(
        // appId: '1:210745451706:android:37025394b564cea8334e83',
        appId: '1:210745451706:android:50b95ed5a3314b02334e83',
        // apiKey: 'AIzaSyBAPDiPofkCKbZ2w2-ny3A9Zpnh6TjOHMg',
        apiKey: 'AIzaSyBAPDiPofkCKbZ2w2-ny3A9Zpnh6TjOHMg',
        projectId: 'benzi-all',
        messagingSenderId: '210745451706',
      );
    }
  }

}
