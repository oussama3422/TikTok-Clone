import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/common/error_text.dart';
import 'package:tiktok_clone_app/features/auth/screens/sing_in_screen.dart';
import 'package:tiktok_clone_app/features/posts/screens/comment_screen.dart';

import 'features/auth/screens/sing_up_screen.dart';

Route<dynamic> genereteRoute(RouteSettings setting){
  switch (setting.name) {
  case SingInScreen.routeName:
        return MaterialPageRoute(builder: (context)=>const SingInScreen());
  case SingUpScreen.routeName:
        return MaterialPageRoute(builder: (context)=>const SingUpScreen());
  case CommentScreen.routeName:
       var id=setting.arguments as String;
        return MaterialPageRoute(builder: (context)=>CommentScreen(id: id));
  default:
      return MaterialPageRoute(builder: (context)=>const Scaffold(
          body:ErrorText(error: 'This Page doesn\'t exist')
         )
      );
  }

}