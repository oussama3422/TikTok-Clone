import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/utils/utils.dart';
import 'package:tiktok_clone_app/models/user.dart' as model;


final authRepositoryProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
});

class AuthRepository{
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
   AuthRepository(this._auth,this._firestore);
  

  Stream<User?> get authStateChange => _auth.authStateChanges();

  // create users geter 
  CollectionReference get _users=>_firestore.collection('users');
  

  void singUp(BuildContext context,String username,String email,String password,File image)async{
    try{
          UserCredential credential =await  _auth.createUserWithEmailAndPassword(email: email, password: password);
          String downloadUrl=await uploadToStorage(image);
          model.User user=model.User(
            name: username,
            email:email,
            uid:credential.user!.uid,
            profilePhone: downloadUrl
            );
          await _firestore.collection('users').doc(credential.user!.uid).set(user.toMap());
    }on FirebaseException catch(error){
        showSnackBar(context, error.message!);
    }
  }

// sing In with email and password [has already account]
  void singIn(BuildContext context,String email,String password)async{
    try{
        await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(error){
      showSnackBar(context, error.message!);
    }
  }


// get User Data
  Stream<model.User> getUserData(String uid){
  return _users.doc(uid).snapshots().map((event) => model.User.fromMap(event.data() as Map<String,dynamic> ));
}

}