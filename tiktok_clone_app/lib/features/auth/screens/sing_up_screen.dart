import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone_app/features/auth/controller/auth_controller.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../widget/text_input_field.dart';

class SingUpScreen extends ConsumerStatefulWidget {
  const SingUpScreen({super.key});

  @override
   ConsumerState<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends  ConsumerState<SingUpScreen> {

  
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  File? image;
  void singUp(BuildContext context){
    var username=_usernameController.text.trim();
    var email= _emailController.text.trim();
    var password= _passwordController.text.trim();
    if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image!=null){
     ref.read(authCntrllrProvider).singUp(
       context,
      _usernameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
      image!,
      );
    }else{
      showSnackBar(context,'please fill all the field');
    } 
  }

  pickImg()async{
    final pickImage=await ImagePicker().pickImage(source:ImageSource.gallery);
    image = File(pickImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TikTok Clone',
                style:TextStyle(fontSize: 35,color:btnClr,fontWeight: FontWeight.w900),
                ),
              const Text(
                'Register',
                style:TextStyle(
                  fontSize:25,
                  fontWeight:FontWeight.w700
                  )
                ),
                const SizedBox(height:15,),
                Stack(
                  children: [
                     const  CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 70,
                      backgroundImage:
                       NetworkImage(
                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS71w7bLh5Kllo26p9H4rw0lWE_DvPPeEp7vA&usqp=CAU',
                        )
                      ),
                    Positioned(
                      bottom:-10,
                      left:80,
                      child: IconButton(
                        icon:const Icon(Icons.camera_alt_rounded,size:35,),
                        onPressed:pickImg,
                        )
                      )
                  ]
                ),
                const SizedBox(height:10),
                Container(
                  width:MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  child:TextInputField(
                    controller: _usernameController,
                    labelText: 'Username',
                    icon: Icons.email,
                    ),
                ),
                const SizedBox(height:15,),
                Container(
                  width:MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  child:TextInputField(
                    controller: _emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                    ),
                ),
                const SizedBox(height:15,),
                Container(
                  width:MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.symmetric(horizontal: 20),
                  child:TextInputField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.email,
                    isObscured: true,
                    ),
                ),
                const SizedBox(height:30),
                Container(
                  width:MediaQuery.of(context).size.width-40,
                  height:50,
                  decoration: BoxDecoration(
                    color:btnClr,
                    borderRadius:const BorderRadius.all(Radius.circular(5))
                    ),
                  child:InkWell(
                    onTap:()=>singUp(context),
                    child: const Center(
                      child:  Text(
                         'Register',
                          style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800)
                         ),
                    ),
                  )
                ),
                const SizedBox(height:15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ? ',style: TextStyle(fontSize: 20),),
                    InkWell(child: Text('Login',style:TextStyle(fontSize: 20,color:btnClr)),onTap: (){print('Register');},)
                  ],
                )
        
            ],
          ),
        )
      )
    );
  }
}