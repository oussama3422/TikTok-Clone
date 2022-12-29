import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';

import '../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indexPage,
        onTap: (newIndex){
          setState(() {
            _indexPage=newIndex;
          });
        },
        selectedItemColor: btnClr,
        unselectedItemColor: whiteColor,
        backgroundColor:backgroundColor ,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size:30),
            label: 'Home',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,size:30),
            label: 'Search',
            ),
          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: '',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,size:30),
            label: 'Message',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size:30),
            label: 'Profile',
            )
        ]
        ),
      body: pages[_indexPage],
    );
  }
}