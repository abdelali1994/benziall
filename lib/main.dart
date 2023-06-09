import 'package:ecommerce_with_admin_panel/constants/theme.dart';
import 'package:ecommerce_with_admin_panel/firebase_helper/firebase_auth_helper/firabase_auth_helper.dart';
import 'package:ecommerce_with_admin_panel/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_helper/firebase_options/firebase_options.dart';
import 'screens/auth_ui/welcome/welcome.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          }
          return const Welcome();
        },
      ),
    );
  }
}
