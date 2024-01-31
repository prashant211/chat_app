import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/forgot_password.dart';
import 'package:chatapp/pages/sign_up.dart';
import 'package:chatapp/pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCGZ47yLevD0XCt1D9L_GEwBXE9qaW-50U",
          appId: "1:788999208531:android:6eb83f936fa1a31c58d0a6",
          messagingSenderId: "788999208531",
          projectId: "project2-8974d"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignIn(),
    );
  }
}
