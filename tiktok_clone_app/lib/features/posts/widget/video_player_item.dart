import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  YoutubePlayerController youtubePlayerController;
  VideoPlayerItem({super.key,required this.videoUrl,required this.youtubePlayerController});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {

  // late VideoPlayerController videoPlayerController;
  // late YoutubePlayerController youtubePlayerController;
  

  
  // @override
  // void initState() {
  //   super.initState();
  //   videoPlayerController=VideoPlayerController.network(widget.videoUrl);

  //    videoPlayerController.addListener(() {
  //     setState(() {});
  //   });
  //   videoPlayerController.setLooping(true);
  //   videoPlayerController.initialize().then((_) => setState(() {}));
  //   videoPlayerController.play();
  // }
  
  @override
  void initState() {
    super.initState();
    widget.youtubePlayerController=YoutubePlayerController(
      initialVideoId:YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags:const YoutubePlayerFlags(
        autoPlay: false,
        loop: false,
        mute: false,
        hideControls: true,
        hideThumbnail: true,
      )
      );
  }

 

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      width:size.width ,
      height: size.height,
      decoration:const BoxDecoration(
        color: Colors.black,
      ),
      child:YoutubePlayerBuilder(
        player:YoutubePlayer(controller: widget.youtubePlayerController),
        builder:(context,player){
          return Column(
            children: [
              player,
            ],
          );
        }
      ),
    );
  }
}