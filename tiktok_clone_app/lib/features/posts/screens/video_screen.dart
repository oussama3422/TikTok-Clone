


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/auth/controller/auth_controller.dart';
import 'package:tiktok_clone_app/features/posts/controller/video_posts_controller.dart';
import 'package:tiktok_clone_app/features/posts/screens/comment_screen.dart';
import 'package:tiktok_clone_app/features/posts/widget/circle_animation.dart';
import 'package:tiktok_clone_app/models/links.dart';
import 'package:tiktok_clone_app/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../common/loader.dart';
import '../widget/video_player_item.dart';

class VideoScreen extends ConsumerStatefulWidget {
  const VideoScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoScreenState();
}
class _VideoScreenState extends ConsumerState<VideoScreen> {
 
  buildProfuile(String profilePhoto){
    return SizedBox(
      width: 60,
      height:60,

      child: Stack(
        children: [
          Positioned(child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(image: NetworkImage(profilePhoto),fit: BoxFit.cover),
            ),
          ),
          ),
        ],
      ),
    );
  }


  // build music Album,
  buildMusicAlbum(String profilePhoto){
   return SizedBox(
    width: 60,
    height:60,
    child:Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: 50,
          height:50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [ borderClr,whiteColor]
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(image: NetworkImage(profilePhoto),fit: BoxFit.cover,),
          )
        )
      ],
    )
   );
  }
  

  // List<Video> videos=[];
  // @override
  // void initState() { 
  //   super.initState();
  //   videos=ref.read(videoPostsControllerProvider).getListVideos();
  // }



  // Like Method from Video controller
  likeVideo(WidgetRef ref,String id){
     ref.read(videoPostsControllerProvider).likeVideo(id,ref);
  }

  late YoutubePlayerController youtubePlayerController;

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<List<Links>>(
          stream:ref.read(videoPostsControllerProvider).getlinVideos(context,ref),
          builder:(context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
                 return const Loader();
            }
           return PageView.builder(
          itemCount:snapshot.data!.length,
          controller: PageController(initialPage: 0,viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
             final data=snapshot.data![index];
                return Stack(
                  children: [
                    VideoPlayerItem(videoUrl:youtubePlayerController.metadata.videoId,youtubePlayerController: youtubePlayerController,),
                    Column(
                      children: [
                         const SizedBox(height:100),
                         Expanded(
                           child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                       Text(
                                        youtubePlayerController.metadata.title,
                                        style:const TextStyle(
                                          color:whiteColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )
                                        ),
                                       Text(
                                        youtubePlayerController.metadata.author,
                                        style:const TextStyle(
                                          color:whiteColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.music_note,size:15,color:whiteColor),
                                            Text(
                                              'songs',
                                              style:const TextStyle(
                                               color:whiteColor,
                                               fontSize: 15,
                                               fontWeight: FontWeight.bold,
                                             ),
                                             ),
                                          ],
                                        ),
                                    ],
                                  ),
                                )
                                ),
      
                                Container(
                                  margin:EdgeInsets.only(top:size.height/5),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                        buildProfuile(''),
                                        Column(
                                        children: [
                                          InkWell(
                                            onTap:(){},
                                            // onTap:()=> likeVideo(ref,data.id),
                                            child: Icon(
                                              Icons.favorite,
                                              size:40,
                                              // color:data.likes.contains(ref.read(authCntrllrProvider).getUser())? btnClr:whiteColor,
                                              color:whiteColor,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Text(
                                              '1',
                                              style:const TextStyle(fontSize: 20,color:whiteColor)
                                              )
                                        ],
                                        ),
                                        Column(
                                        children: [
                                          InkWell(
                                            onTap: (){},
                                            // onTap: ()=>Navigator.of(context).pushNamed(CommentScreen.routeName,arguments: data.id),
                                            child: Icon(
                                              Icons.comment,
                                              size:40,color:btnClr
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Text(
                                              '1',
                                              style:const TextStyle(fontSize: 20,color:whiteColor)
                                              )
                                        ],
                                        ),
                                        Column(
                                        children: [
                                          InkWell(
                                            onTap: (){},
                                            child: Icon(
                                              Icons.reply,
                                              size:40,color:btnClr
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            const Text('2',style:TextStyle(fontSize: 20,color:whiteColor))
                                        ],
                                        ),
                                       CircleAnimation(child:buildMusicAlbum(youtubePlayerController.metadata.videoId))
                                    ],
                                  ),
                                ),
                             ],
                           ),
                         )
                      ],
                    ),
                  ],
                );
          }
          );
          }
      ),
    );
  }
}
