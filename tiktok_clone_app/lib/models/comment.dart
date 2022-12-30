import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Comment {
  String username;
  String commt;
  final dataPublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;
  Comment({
    required this.username,
    required this.commt,
    required this.dataPublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'commt': commt,
      'dataPublished':dataPublished,
      'likes': likes,
      'profilePhoto': profilePhoto,
      'uid': uid,
      'id': id,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      username: map['username'],
      commt: map['commt'],
      dataPublished: map['dataPublished'],
      likes: List.from(map['likes']),
      profilePhoto: map['profilePhoto'],
      uid: map['uid'],
      id: map['id'],
    );
  }
  factory Comment.fromSnap(DocumentSnapshot snap) {
    final snapshot=snap.data() as Map<String,dynamic>;
    return Comment(
      username: snapshot['username'],
      commt: snapshot['commt'],
      dataPublished: snapshot['dataPublished'],
      likes: List.from(snapshot['likes']),
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot['id'],
    );
  }



 

}
