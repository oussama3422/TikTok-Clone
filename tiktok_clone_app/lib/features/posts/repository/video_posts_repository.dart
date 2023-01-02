import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/core/utils/utils.dart';
import 'package:tiktok_clone_app/features/auth/controller/auth_controller.dart';
import 'package:tiktok_clone_app/features/home/screens/home_screen.dart';
import 'package:tiktok_clone_app/models/comment.dart';
import 'package:tiktok_clone_app/models/links.dart';
import 'package:tiktok_clone_app/models/video.dart';
import 'package:uuid/uuid.dart';
import '../../../models/user.dart' as model;



final videoPostsRepositoryProvider = Provider((ref) {
  return VideoPostsRepositry(FirebaseFirestore.instance);
});

class VideoPostsRepositry{
   FirebaseFirestore firebaseFirestore;
   
   VideoPostsRepositry(this.firebaseFirestore);


   CollectionReference get _comments => firebaseFirestore.collection('comments');
   CollectionReference get _users => firebaseFirestore.collection('users');
   CollectionReference get _videos => firebaseFirestore.collection('videos');
   CollectionReference get _postslinks => firebaseFirestore.collection('Postslinks');

  // get User Data  

  String _postId="";



  Stream<List<Video>> getPosts(){
    return _videos.snapshots().map((QuerySnapshot query){
     List<Video> videosPost=[];
      for(var element in query.docs  ){
        videosPost.add(Video.fromSnap(element));
      }
      return videosPost;
    }
    );
  }
  // //get list Videos
  // List<Video> getVideos(){
  //   List<Video> newList=[];
  //   for (var item in _videosPost){
  //     newList.add(item);
  //   }
  //   return newList;
  // }




  // like videos Method
  likeVideo(String id,WidgetRef ref) async{
    var doc=await _videos.doc(id).get();
    var uid=ref.read(authCntrllrProvider).getUser();
    if((doc.data()! as dynamic)['likes'].contains(uid)){
      await _videos.doc(id).update({
          'likes':FieldValue.arrayRemove(uid)
      });
    }else{
      await _videos.doc(id).update({
          'likes':FieldValue.arrayUnion(uid)
      });
    }
  }

  // get Update Post
  getComments(){
 return _comments.snapshots().map((QuerySnapshot query){
      List<Comment> comment=[];
      for(var element in query.docs){
        comment.add(Comment.fromSnap(element));
      }
      return comment;
    }
    );
  }

Stream<List<Comment>> getCommentsOfPost(String postId){
  return _comments
  .where('id',isEqualTo: postId)
  .snapshots().map((event) => event.docs.map(
    (event) => Comment.fromMap(
    event.data() as Map<String,dynamic>
    )).toList()
  );
  }

  
  //post Comment
  postComment(BuildContext context,String commentText,WidgetRef ref,String id)async{
     try{
      DocumentSnapshot userDoc=await _users.doc(ref.read(authCntrllrProvider).getUser()).get();
      var allDocs=await _videos.doc(id).collection('comments').get();
      var len=allDocs.docs.length;

      Comment comment=Comment(
        username: (userDoc.data() as dynamic)['name'],
        commt: commentText.trim(),
        dataPublished: DateTime.now(),
        likes: [],
        profilePhoto: (userDoc.data() as dynamic)['profilePhoto'],
        uid: (userDoc.data() as dynamic)['uid'],
        id: 'Comment $len'
        );

      await _videos.doc(_postId).collection('comments').doc('Comment $len').set(comment.toMap());
      DocumentSnapshot doc2=await _comments.doc(_postId).get();
      _videos.doc(_postId).update({
        'commentCount':(doc2.data()! as dynamic)['commentCount'] + 1
      });
     }catch(error){
        showSnackBar(context, error.toString());
     }
     
  }

  //like Comment Method
  
  likeComment(String id,WidgetRef ref)async{
    var uid=ref.read(authCntrllrProvider).getUser();
    DocumentSnapshot doc=await _videos.doc(_postId).collection('comments').doc(id).get();
 
    if((doc.data()! as dynamic)['likes'].contains(uid)){
      _videos.doc(_postId).collection('comments').doc(id).update(
        {
          'likes':FieldValue.arrayRemove([uid]),
        }
      );
    }else{
       _videos.doc(_postId).collection('comments').doc(id).update(
        {
          'likes':FieldValue.arrayUnion([uid]),
       });
    }
  }
  /// get Links Posts
  Stream<List<Links>> getLinksOfPost(BuildContext context,WidgetRef ref){
    try{

      var uid=ref.read(authCntrllrProvider).getUser();
      return _postslinks.where('uid',isEqualTo: uid).snapshots().map(
     (event) => event.docs.map(
          (event) => Links.fromMap(
           event.data() as Map<String,dynamic>
          )
    ).toList()
  );
  }catch(error){
     return showSnackBar(context, 'message ${error.toString()}');
  }
  }

  //post link video
  postlinkVideo(BuildContext context,WidgetRef ref,String linkVideo)
  async{
   try{
      var uid=ref.read(authCntrllrProvider).getUser();
      var id=const Uuid().v1();
      _postslinks.doc(uid).collection('userslinks').doc(id);
      // ignore: use_build_context_synchronously
      Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
   }catch(error){
    showSnackBar(context, error.toString());
   }
  }
  //postLinks
  Stream<List<Links>> postLinks(WidgetRef ref,BuildContext context){
    try{
      var uid=ref.read(authCntrllrProvider).getUser();
      return _postslinks.doc(uid).collection('userslinks').snapshots().map((QuerySnapshot query){
      List<Links> videosPost=[];
      for(var element in query.docs  ){
        videosPost.add(Links.fromSanp(element));
      }
          return videosPost;
      }); 
    }catch(error){
   return showSnackBar(context, 'message ${error.toString()}');
    }
  }
  
  //get all posts Links

  
}