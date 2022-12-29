// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/home/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src,BuildContext context,)async{
    final video=await ImagePicker().pickVideo(source: src);
    if(video!=null){
      MaterialPageRoute(
          builder: (context)=>ConfirmScreen(videoFile: File(video.path), videoPath: video.path)
      );
    }
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