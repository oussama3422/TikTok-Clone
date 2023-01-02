import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Links {
  String uid;
  String url;
  Links({
    required this.uid,
    required this.url,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'url': url,
    };
  }

  factory Links.fromMap(Map<String,dynamic> event) {
    return Links(
      uid: event['uid'],
      url: event['url'],
    );
  }
  factory Links.fromSanp(DocumentSnapshot sanp) {
    var snapshot=sanp.data() as Map<String,dynamic>;
    return Links(
      uid: snapshot['uid'],
      url: snapshot['url'],
    );
  }

}
