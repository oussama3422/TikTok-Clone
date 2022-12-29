import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/auth/controller/auth_controller.dart';
import 'package:tiktok_clone_app/models/video.dart';

import '../../../models/user.dart' as model;



final videoPostsRepositoryProvider = Provider((ref) {
  return VideoPostsRepositry(FirebaseFirestore.instance);
});

class VideoPostsRepositry{
   FirebaseFirestore firebaseFirestore;
   VideoPostsRepositry(this.firebaseFirestore);
  // get User Data  
  Stream<List<Video>> getPosts(){
    return firebaseFirestore.collection('videos').snapshots().map((QuerySnapshot query){
      List<Video> videos=[];
      for(var element in query.docs){
        videos.add(Video.fromSnap(element));
      }
      return videos;
    }
    );
  }


  // like videos Method
  
  likeVideo(String id) async{
    var doc=await firebaseFirestore.collection('videos').doc(id).get();
    model.User? user;
    var uid=user!.uid;
    if((doc.data()! as dynamic)['likes'].contains(uid)){
      await firebaseFirestore.collection('videos').doc(id).update({
          'likes':FieldValue.arrayRemove([uid])
      });
    }else{
      await firebaseFirestore.collection('videos').doc(id).update({
          'likes':FieldValue.arrayUnion([uid])
      });
    }
  }
  
}