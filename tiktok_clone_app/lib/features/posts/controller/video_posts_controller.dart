import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/auth/repository/auth_repository.dart';
import 'package:tiktok_clone_app/features/posts/repository/video_posts_repository.dart';
import 'package:tiktok_clone_app/models/video.dart';

import '../../../models/comment.dart';


final videoPostsControllerProvider = Provider((ref) {
  return VideoPostsController(videoPostsRepositry: ref.watch(videoPostsRepositoryProvider),);
});

class VideoPostsController{



  VideoPostsRepositry videoPostsRepositry;
  VideoPostsController({required this.videoPostsRepositry});

  Stream<List<Video>> getPostsVideos(){
    return videoPostsRepositry.getPosts();
  }
   
  //like video
  likeVideo(String id,WidgetRef ref){
    videoPostsRepositry.likeVideo(id,ref);
  }

  //get comemnt
  Stream<List<Comment>> getCommentsOfPostById(String id){
   return videoPostsRepositry.getCommentsOfPost(id);
  }
 // get videos List
//  List<Video> getListVideos(){
//   return videoPostsRepositry.getVideos();
  
//  }

  postComment(BuildContext context,String commentText,WidgetRef ref,String id){
    return videoPostsRepositry.postComment(context, commentText, ref,id);
  }
  //postlinkVideo
  postlinkVideo(BuildContext context,WidgetRef ref,String linkVideo){
    videoPostsRepositry.postlinkVideo(context,ref, linkVideo);
  }
  //getLinkVideos
  getlinVideos(BuildContext context,WidgetRef ref){
    videoPostsRepositry.getLinksOfPost(context,ref);
  }
  //getLinks
  getLinks(BuildContext context,WidgetRef ref){
    videoPostsRepositry.postLinks(ref,context);
   
  }

}