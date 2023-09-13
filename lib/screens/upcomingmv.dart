import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';

import 'description.dart';
class upcomingmv extends StatelessWidget
{
  final List up;

  const upcomingmv({super.key, required this.up});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mtext(text: 'Upcoming Movies', size: 26, color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 270,
              child: ListView.builder(itemCount: up.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: up[index]['title'],
                          description: up[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+up[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+up[index]['poster_path'],
                          vote: up[index]['vote_average'].toString(),
                          launch_on: up[index]['release_date'],)));

                      },child:
                    up[index]['title']!=null? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+up[index]['poster_path']
                                ))
                            ),
                          ),
                          Container(
                            child: mtext(text:up[index]['title']!=null?
                            up[index]['title']:'loading', color: Colors.white, size: 10,),)
                        ],
                      ),
                    ):Container(),
                    );
                  }),)
          ],
        ),
      ),
    );
  }
}