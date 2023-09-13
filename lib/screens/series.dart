import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';

import 'description.dart';
class Tvshows extends StatelessWidget
{

  final List tseries;


   Tvshows({super.key, required this.tseries});


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
              child: ListView.builder(itemCount: tseries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: tseries[index]['original_name'],
                          description: tseries[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+tseries[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+tseries[index]['poster_path'],
                          vote: tseries[index]['vote_average'].toString(),
                          launch_on: tseries[index]['first_air_date'],)));

                      },child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500'+(tseries[index]['poster_path']!=null?tseries[index]['poster_path']:''),
                                ),
                                )
                            ),
                          ),
                          Container(
                            child: mtext(text:tseries[index]['original_name']!=null?
                            tseries[index]['original_name']:'loading', color: Colors.white, size: 10,),)
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