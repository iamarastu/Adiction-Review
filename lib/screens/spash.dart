import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:movie/main.dart';
import 'package:movie/screens/navigation.dart';

class splash extends StatefulWidget
{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 4800), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>navigation()));
    });
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),

              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height:300, //MediaQuery.of(context).size.height ,
                    width: 400,//MediaQuery.of(context).size.width ,
                    // Below is the code for Linear Gradient.

                    child: Center(child: Text("Addiction Review",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                  Container(
                    child: Lottie.network('https://lottie.host/e492d4a8-d4a7-43db-9411-ab358a01c865/QRfB59QSQG.json',width: 400,height: 400,),
                  )
                ],
              ),
            ),
          );
    }
}