import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/features/auth/widget/text_input_field.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {



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
              'Login',
              style:TextStyle(
                fontSize:25,
                fontWeight:FontWeight.w700
                )
              ),
              const SizedBox(height:25,),
              Container(
                width:MediaQuery.of(context).size.width,
                margin:const EdgeInsets.symmetric(horizontal: 20),
                child:TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  ),
              ),
              const SizedBox(height:25,),
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
                       'Login',
                        style:TextStyle(fontSize: 20,fontWeight: FontWeight.w800)
                       ),
                  ),
                )
              ),
              const SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account ? ',style: TextStyle(fontSize: 20),),
                  InkWell(child: Text('Register',style:TextStyle(fontSize: 20,color:btnClr)),onTap: (){print('Register');},)
                ],
              )

          ],
        )
      )
    );
  }
}