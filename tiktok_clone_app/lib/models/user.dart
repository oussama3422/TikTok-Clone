import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilePhoto;
  String email;
  String uid;
  User({
    required this.name,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      profilePhoto: map['profilePhone'],
      email: map['email'],
      uid: map['uid'],
    );
  }
  factory User.fromSnap(DocumentSnapshot snap) {
    var snapshot=snap.data() as Map<String,dynamic>;
    return User(
      name: snapshot['name'],
      profilePhoto: snapshot['profilePhone'],
      email: snapshot['email'],
      uid: snapshot['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));



}
