

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/utils/utils.dart';
import 'package:tiktok_clone_app/models/video.dart';
import 'package:video_compress/video_compress.dart';

final homeRepositoryProvider = Provider((ref) {
  return HomeRepository(FirebaseFirestore.instance, FirebaseAuth.instance, FirebaseStorage.instance);
});


class HomeRepository{

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage firebaseStorage;
  HomeRepository(this.firestore,this.auth,this.firebaseStorage);



  //Comprese Video
  _compreseVideo(String videoPath)async{
    final compressVideo=await  VideoCompress.compressVideo(videoPath,quality: VideoQuality.MediumQuality);
     return compressVideo!.file;
  }

  
  // upload video Method
  Future<String> _uploadVideoToStorage(String id,String videoPath)async{
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    var uploadTask =ref.putFile(await _compreseVideo(videoPath));
    TaskSnapshot snap=await uploadTask;
    String downloadUrl=await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  //Get Thumbnail
  _getThumbnail(String videoPath)async{
     final thumbnail=await VideoCompress.getFileThumbnail(videoPath);
     return thumbnail;
   }
  // upload image to Storage
  Future<String> _uploadImageToStorage(String id,String videoPath)async{
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask =ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap=await uploadTask;
    String downloadUrl=await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  // upload video Method
  uploadVideo(BuildContext context,String songName,String caption,String vioPath)async{
      try{
       String uid=auth.currentUser!.uid;
       DocumentSnapshot userDoc=await firestore.collection('users').doc(uid).get();
        //get video id
        var allDocs=await firestore.collection('videos').get();
        int len=allDocs.docs.length;
        String videoUrl =await _uploadVideoToStorage("Video $len",vioPath);
        String thumbnail =await _uploadImageToStorage("Video $len", vioPath);

        Video video=Video(
          username: (userDoc.data()! as Map<String,dynamic>)['name'],
          uid: uid,
          id: 'Video $len',
          likes: [],
          commentCount: 0,
          shareCount: 0,
          songName: songName,
          caption: caption,
          videoUrl: videoUrl,
          thumbnail: thumbnail,
          profilePhoto: (userDoc.data()! as Map<String,dynamic>)['profilePhoto']
        );
        await firestore.collection('videos').doc('Video $len').set(video.toJson());
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }catch(error){
            showSnackBar(context, error.toString());
      }



  }

  


}