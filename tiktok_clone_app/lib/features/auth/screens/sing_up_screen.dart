import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants.dart';
import '../widget/text_input_field.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        child:Column(
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
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 70,
                    backgroundImage: NetworkImage(
                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS71w7bLh5Kllo26p9H4rw0lWE_DvPPeEp7vA&usqp=CAU'
                      ),
                    ),
                  Positioned(
                    bottom:-10,
                    left:80,
                    child: IconButton(
                      icon:const Icon(Icons.camera_alt_rounded,size:35,),
                      onPressed: (){},
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
                  onTap:(){print('hello world');},
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
        )
      )
    );
  }
}