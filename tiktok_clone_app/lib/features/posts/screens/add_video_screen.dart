// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/core/utils/utils.dart';
import 'package:tiktok_clone_app/features/home/screens/confirm_screen.dart';
import 'package:tiktok_clone_app/features/posts/controller/video_posts_controller.dart';

class AddVideoScreen extends ConsumerStatefulWidget {
  const AddVideoScreen({super.key});

  @override
  ConsumerState<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends ConsumerState<AddVideoScreen> {

  TextEditingController linkController=TextEditingController();

  @override
  void dispose() { 
    super.dispose();
    linkController.dispose();
  }

  pickVideo(ImageSource src,BuildContext context,)async{
    var video=await ImagePicker().pickVideo(source: src);
    if(video!=null){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>ConfirmScreen(videoFile: File(video.path), videoPath: video.path))
      );
    }else{
      showSnackBar(context, 'Somthing Went Wrong');
    }
  }
 //postLink
 postlink(){
  if(linkController.text.trim().isNotEmpty){
     ref.read(videoPostsControllerProvider).postlinkVideo(context, ref, linkController.text.trim());
  }else{
    showSnackBar(context,'please enter a propper link');
  }
 }
  showTextFromField(BuildContext context){
    return showDialog(
      context:context,
      builder:(context)=>SimpleDialog(
          children: [
            SimpleDialogOption(
              child:Column(
                children: [
                  TextFormField(
                    controller: linkController,
                    decoration: InputDecoration(
                      hintText: 'Enter youtube url ',
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: btnClr,
                      fixedSize:const Size(double.infinity, 35),
                    ),
                    onPressed: postlink,
                    child:const Text("Add Link video",)
                     ),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: btnClr,
                      fixedSize:const Size(double.infinity, 35),
                    ),
                    onPressed: ()=>Navigator.of(context).pop(),
                    child:const Text("Back",)
                     )
                ],
                )
            )
          ],
      ) ,
      );
  }

 showOptionDialog(BuildContext context,){
  return showDialog(context: context, builder: (context)=>SimpleDialog(
    children: [
        SimpleDialogOption(
          onPressed: () =>pickVideo(ImageSource.gallery, context),
          child: Row(
            children:const [
              Icon(Icons.image),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Gallery',style:TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: ()=>pickVideo(ImageSource.camera, context),
          child: Row(
            children:const [
              Icon(Icons.camera_alt),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Camera',style:TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: ()=>showTextFromField(context),
          child: Row(
            children:const [
              Icon(Icons.link_sharp),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Share Link',style:TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () =>Navigator.of(context).pop(),
          child: Row(
            children:const [
              Icon(Icons.cancel_outlined),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cancel',style:TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
    ],
  )
  );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap:(){
             return showOptionDialog(context);
            },
            child:Container(
              width: 190,
              height:50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:btnClr,
              ),
              child:const Center(
                child: Text(
                     'Add Video',
                     style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                     ),
                     ),
              ) ,
            )
        ),
      ),
    );
  }
}