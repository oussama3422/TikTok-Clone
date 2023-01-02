

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/profile/screen/profile_screen.dart';
import 'package:tiktok_clone_app/features/search/controller/search_controller.dart';

import '../../../models/user.dart';

// ignore: must_be_immutable
class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
  

  List<User>? retVal=[];
  
  searchUser(String typeUser,WidgetRef ref)async{
    retVal=ref.read(searchControllerProvider).searchUser(typeUser);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<User>>(
      stream: searchUser('',ref),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              decoration:const InputDecoration(
                enabled: true,
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color:whiteColor,
                ),
              ),
              onFieldSubmitted:(item)=>searchUser(item,ref),
            ),
          ),
          body:retVal!.isEmpty? const Center(
            child:Text(
              'Serach for users',
              style:TextStyle(fontSize: 25,color:whiteColor,fontWeight:FontWeight.bold))
          )
          :
          ListView.builder(
            itemBuilder: (context,index){
              User user=retVal![index];
              return InkWell(
                onTap: ()=>Navigator.of(context).pushNamed(ProfileScreen.routeName,arguments: user.uid),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:NetworkImage(user.profilePhoto ),
                    ),
                  title: Text(
                    user.name,
                    style:const TextStyle(
                      fontSize: 18,
                      color: whiteColor
                      ),
                      ),
                ),
              );
            }
            )
        );
      }
    );
  }
}