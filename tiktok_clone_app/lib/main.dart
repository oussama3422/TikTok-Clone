import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/core/constants.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_in_screen.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp((child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      home:const SingUpScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
    );
  }
}