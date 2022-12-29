import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/home/repository/home_repository.dart';

final homeControllerProvider = Provider((ref) {
  return HomeController(ref.watch(homeRepositoryProvider)) ;
});

class HomeController{

  final HomeRepository homerepository;
  HomeController(this.homerepository);
  
  
  // upload Video
  uploadVideo(BuildContext context,String songName,String caption,String vioPath){
    homerepository.uploadVideo(context, songName, caption, vioPath);
  }




}