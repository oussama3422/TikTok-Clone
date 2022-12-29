import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/auth/widget/text_input_field.dart';
import 'package:tiktok_clone_app/features/home/controller/home_controller.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends ConsumerStatefulWidget {
  static const routeName='/confirm-screen';
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({super.key,required this.videoFile,required this.videoPath});
  @override
  ConsumerState<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends ConsumerState<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController songController=TextEditingController();
  TextEditingController captionController=TextEditingController();

  void upladVideo(){
    ref.read(homeControllerProvider).uploadVideo(
      context,
      songController.text.trim(),
      captionController.text.trim(),
      widget.videoPath
      );
  }

  
  @override
  void initState() {
    super.initState();
   setState(() {
     controller=VideoPlayerController.file(widget.videoFile);
   });
   controller.initialize();
   controller.play();
   controller.setVolume(1);
   controller.setLooping(true);
  }
   @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: [
              const SizedBox(height:30),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.5,
                child:VideoPlayer(controller)
                ),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 10),
                        width:MediaQuery.of(context).size.width-20,
                        child:TextInputField(
                          controller: songController,
                          labelText: 'Name of Song',
                          icon: Icons.music_note,
                          )
                      ),
                     const SizedBox(height: 10),
                       Container(
                        margin:const EdgeInsets.symmetric(horizontal: 10),
                        width:MediaQuery.of(context).size.width-20,
                        child:TextInputField(
                          controller: captionController,
                          labelText: 'Caption',
                          icon: Icons.closed_caption,
                          ),
                      ),
                     const SizedBox(height: 10),
                     ElevatedButton(
                      onPressed: upladVideo,
                      child: const Text(
                        'Share',
                        style: TextStyle(fontSize: 20,color:Colors.white),
                        )
                      )
                    ],
                  ),
                )
            ],
          )
        ),
    );
  }
}