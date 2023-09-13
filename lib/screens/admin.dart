import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie/widgets/util.dart';

class admin extends StatefulWidget {
  const admin({super.key});

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  var firestoreDB=FirebaseFirestore.instance.collection("board").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: mtext(
              text: ("Adiction Review❤️"),
              color: Colors.white,
              size: 20,
            )),
      ),
        body: StreamBuilder(stream:firestoreDB,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Center(
            child: CarouselSlider.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,int index,_){
                  return Container(
                     // color: Colors.purpleAccent,
                     // height: 90,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        //color: Colors.purpleAccent,
                        gradient: LinearGradient(
                          colors: [Colors.blue,Colors.purpleAccent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: const [
                         BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,

                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 5,),
                            Container(
                              width: 220,
                                child: Center(child: mtext(text: snapshot.data.docs[index]['title'], color: Colors.white, size: 20))),
                            SizedBox(height: 15,),
                            Container(
                              child: mtext(text: 'Rating: '+snapshot.data.docs[index]['Rating']+' ⭐', color: Colors.black, size: 18),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: 220,
                                height: 300,
                              child: Center(
                                child: SingleChildScrollView(scrollDirection: Axis.vertical,
                                    child: mtext(text: snapshot.data.docs[index]['description'], color: Colors.white, size: 14,),
                              ),
                            ),
                            )
                          ],
                        ),
                      )
                  );
            }, options: CarouselOptions(
              enlargeCenterPage: true,
              //autoPlay: true,
              viewportFraction: 0.7,
              scrollDirection: Axis.horizontal,
              height: 400


            ),),
          );
          },),
    );
  }
}
