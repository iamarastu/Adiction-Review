import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/screens/admin.dart';
import 'package:movie/screens/tv.dart';
import '../main.dart';

class navigation extends StatefulWidget
{
  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  int index_screen=0;

  List screen=[MyHomePage(),tv(),admin()];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade900,
        animationDuration: Duration(milliseconds: 350),
        height: 48,
        index: index_screen,
        items: [
          Icon(Icons.home_outlined),
          Icon(Icons.tv),
          Icon(Icons.message)
        ],
      onTap: (index){
          setState((){
            index_screen=index;
          });
      },),
      body: screen[index_screen],
    );
  }
}
