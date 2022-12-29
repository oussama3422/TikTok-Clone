import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/posts/repository/video_posts_repository.dart';
import 'package:tiktok_clone_app/models/video.dart';


final videoPostsControllerProvider = Provider((ref) {
  return VideoPostsController(videoPostsRepositry: ref.watch(videoPostsRepositoryProvider));
});

class VideoPostsController{



  VideoPostsRepositry videoPostsRepositry;
  VideoPostsController({required this.videoPostsRepositry});

  Stream<List<Video>> getPostsVideos(){
    return videoPostsRepositry.getPosts();
  }

  //like video
  likeVideo(String id){
    videoPostsRepositry.likeVideo(id);
  }

}