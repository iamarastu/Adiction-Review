import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';

import 'description.dart';
class tvair extends StatelessWidget
{

  final List todayair;


  tvair({super.key, required this.todayair});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mtext(text: 'OnAir Tv Shows', size: 26, color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 270,
              child: ListView.builder(itemCount: todayair.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: todayair[index]['original_name'],
                          description: todayair[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+todayair[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+todayair[index]['poster_path'],
                          vote: todayair[index]['vote_average'].toString(),
                          launch_on: todayair[index]['first_air_date'],)));

                      },child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+(todayair[index]['poster_path']!=null?todayair[index]['poster_path']:''),
                                ),
                                )
                            ),
                          ),
                          Container(
                            child: mtext(text:todayair[index]['original_name']!=null?
                            todayair[index]['original_name']:'loading', color: Colors.white, size: 10,),)
                        ],
                      ),
                    ),
                    );
                  }),)
          ],
        ),
      ),
    );
  }

}