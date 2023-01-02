import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user.dart';
final searchRepositoryProvider = Provider((ref) {
  return SearchRepository(FirebaseFirestore.instance);
});


class SearchRepository{
  
  final FirebaseFirestore firebaseFirestore;
  SearchRepository(this.firebaseFirestore);

   CollectionReference get _users => firebaseFirestore.collection('users');


  // search fro users Method
  searchUser(String typeUser)async{
    return _users.where('name',isGreaterThanOrEqualTo: typeUser).snapshots().map((QuerySnapshot query){
      List<User> retVal=[];
      for(var item in query.docs){
        retVal.add(User.fromSnap(item));
      }
      return retVal;
    });

    


  }
}