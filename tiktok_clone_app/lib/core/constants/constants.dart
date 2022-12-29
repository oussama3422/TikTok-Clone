

//Colors


import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/features/posts/screens/add_video_screen.dart';
import 'package:tiktok_clone_app/features/posts/screens/video_screen.dart';

const backgroundColor=Colors.black;
final btnClr=Colors.red[300];
const borderClr=Colors.grey;
const whiteColor=Colors.white;


//pages
const pages=[
  VideoScreen(),
  Center(child: Text('Search Screen')),
  AddVideoScreen(),
  Center(child: Text('Message Screen')),
  Center(child: Text('Profile Screen')),
  ];


