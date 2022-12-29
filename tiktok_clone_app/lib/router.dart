import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/common/error_text.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_in_screen.dart';

Route<dynamic> genereteRoute(RouteSettings setting){
  switch (setting.name) {
  case SingInScreen.routeName:
        return MaterialPageRoute(builder: (context)=>const SingInScreen());
  default:
      return MaterialPageRoute(builder: (context)=>const Scaffold(
          body:ErrorText(error: 'This Page doesn\'t exist')
         )
      );
  }

}