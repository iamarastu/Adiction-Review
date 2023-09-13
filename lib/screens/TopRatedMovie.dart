import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';
import 'description.dart';

class TopRatedMovie extends StatelessWidget
{
  final List toprated;

  const TopRatedMovie({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mtext(text: 'Top Rated Movies', size: 26, color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 270,
              child: CarouselSlider.builder(itemCount: toprated.length,
                  itemBuilder: (context,index,_){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: toprated[index]['title'],
                          description: toprated[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                          vote: toprated[index]['vote_average'].toString(),
                          launch_on: toprated[index]['release_date'],)));

                      },child:
                    toprated[index]['title'].isEmpty? CircularProgressIndicator() : Container(
                      width: 140,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height:200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                                  ))
                              ),
                            ),
                            Container(
                              child: mtext(text:toprated[index]['title']!=null?
                              toprated[index]['title']:'loading', color: Colors.white, size: 13,),)
                          ],
                        ),
                      ),
                    )//:Container(),
                    );
                  }, options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 0.5,
                  

                ),),)
          ],
        ),
      ),
    );
  }
}