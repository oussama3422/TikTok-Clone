import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_in_screen.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiktok_clone_app/features/home/screens/home_screen.dart';
import 'package:tiktok_clone_app/router.dart';
import 'common/error_text.dart';
import 'common/loader.dart';
import 'features/auth/controller/auth_controller.dart';
import 'firebase_options.dart';
import 'models/user.dart' as model;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const ProviderScope(child: ( MyApp())));
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
    model.User? userModel;

  @override
  Widget build(BuildContext context) {
     return  MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
        theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute: (setting)=>genereteRoute(setting),
      home:ref.watch(authStateChangeProvider).when(
      data:(user) {
        if(user==null){
            return const SingInScreen();
        }else{
          return const HomeScreen();
        }
      },
      error: (error,snackTrace)=>ErrorText(error: error.toString()),
     loading: ()=>const Loader(),
     )
     );
  }
}


