import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/features/auth/repository/auth_repository.dart';
import 'package:tiktok_clone_app/models/user.dart' as model;

final userProvder=StateProvider<model.User?>((ref) => null );

final authControllerProvider=StateNotifierProvider<AuthController,bool>(
  (ref)=>AuthController(
    ref.watch(authRepositoryProvider),
    )
);

final authStateChangeProvider=StreamProvider((ref){
  final authController=ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final authCntrllrProvider=Provider((ref) {
  return AuthController(
    ref.watch(authRepositoryProvider),
    );
});
  

class AuthController extends StateNotifier<bool>{
  AuthRepository authRepository;
  AuthController(this.authRepository):super(false);
  Stream<User?> get authStateChange=>authRepository.authStateChange;
  
  void singUp(BuildContext context,String username,String email,String password,File image)async{
    {
      state=true;
      authRepository.singUp(context, username, email, password, image);
      state=false; 
    }

  }

  void singIn(BuildContext context,String email,String password)
  {
    state=true;
    authRepository.singIn(context, email, password);
    state=false;
  }
  

  // getUser Data
  Stream<model.User> getUserData(String uid){
   return authRepository.getUserData(uid);
  //get user uid
   }
  //get user uid
  getUser(){
   return authRepository.getUser();
  }

  //signOut
   Future<void> singOut()async{
    authRepository.singOut();
  }
  
  }