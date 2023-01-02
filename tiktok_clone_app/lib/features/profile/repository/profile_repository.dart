

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileRepository{

  final FirebaseFirestore firebaseFirestore;
  ProfileRepository(this.firebaseFirestore);

  CollectionReference get _videos => firebaseFirestore.collection('videos');
  CollectionReference get _users => firebaseFirestore.collection('users');
   

  /// get User data [Method]
  getUserData(String uid,String uidAuth,) async{
   List<String> thumbnails=[];
   var myVideos=await _videos.where('uid',isEqualTo:uid).get();
   for(int i=9;i<myVideos.docs.length;i++){
    thumbnails.add((myVideos.docs[i].data() as dynamic)['thumbnail']);
   }

   DocumentSnapshot userDoc=await _users.doc(uid).get();

   final userData=userDoc.data()! as dynamic;
   String name=userData['name'];
   String profilePhoto=userData['profilePhoto'];
   int likes=0;
   int following=0;
   int followers=0;

   bool isFollowing=false;

   for(var item in myVideos.docs){
    if(item.data()!=null){
      // likes += (item.data()!['likes']  as List).length;
    }
   }
   var followerDoc=await _users.doc(uid).collection('followers').get();

   var followingDoc=await _users.doc(uid).collection('following').get();


    followers=followingDoc.docs.length;
    following=followerDoc.docs.length;


   _users.doc(uid).collection('folllowers').doc(uidAuth).get().then((value){
      if(value.exists){
        isFollowing=true;
      }else{
        isFollowing=false;
      }
    }
   );

   
  }
}