import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/auth/controller/auth_controller.dart';
import 'package:tiktok_clone_app/models/user.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeName='/prifle-screen';

  const ProfileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends ConsumerState<ProfileScreen> {


/// sing Out Method from [authController]
  singOut(){
    ref.read(authCntrllrProvider).singOut();
  }



  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: balckColor12,
            leading:const Icon(Icons.person_add_alt_1_outlined) ,
            actions:const [
              Icon(Icons.more_horiz),
            ],
            title:const Text('username',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
          ),
          body: SafeArea(
            child: Column(
               children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         ClipOval(
                          child:CachedNetworkImage(
                            fit:BoxFit.cover,
                            imageUrl: '',
                            height:100,
                            width:100,
                            placeholder:(context,url)=>const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>const Icon(Icons.error),
                            ),
                         )
                      ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Column(
                              children: [
                                Text('10',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                const SizedBox(height:15),
                                Text('Following',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
    
                              ],
                            ),
                            Container(color: Colors.black45,height:15,width: 1,margin:const EdgeInsets.symmetric(horizontal: 15)),
                            Column(
                              children: [
                                Text('10',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                const SizedBox(height:15),
                                Text('Followers',style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
    
                              ],
                            ),
                            Container(color: Colors.black45,height:15,width: 1,margin:const EdgeInsets.symmetric(horizontal: 15)),
                            Column(
                              children: [
                                Text('10',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                const SizedBox(height:15),
                                Text('Likes',style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
    
                              ],
                            ),
                        ],
                      ),
    
                      const SizedBox(height:15),
                      Container(
                        width: 140,
                        height:47,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: balckColor12,
                          )
                        ),
                        child:InkWell(
                          onTap: singOut,
                          child: const Center(
                            child:Text('Sign Out',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                          ),
                        ),
                      )
                      //video list
                  ],
                )
               ],
            ),
          )
        );
      }
    );
  }
}