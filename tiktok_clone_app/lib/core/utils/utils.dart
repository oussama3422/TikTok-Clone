

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// show snack Bar
showSnackBar(BuildContext context,String message){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}



// upload image function 1
Future<String> uploadToStorage(File image)async{
  Reference ref=FirebaseStorage.instance.ref().child('profilePic').child(FirebaseAuth.instance.currentUser!.uid);
  UploadTask uploadTask=ref.putFile(image);
  TaskSnapshot snapshot=await uploadTask;

  String downloadUrl=await snapshot.ref.getDownloadURL();

  return downloadUrl;
}


// upload image function 2
// Future<File?> pickImageFromGallery(BuildContext context)async{
//   File? image;
//   try{
//       final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (pickedImage!=null){
//         image=File(pickedImage.path);
//       }
//   }catch(error){
//     showSnackBar(context,error.toString());
//   }
//   return image;
// }