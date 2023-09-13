import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';
import 'description.dart';
class TrendingMovies extends StatelessWidget
{
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mtext(text: 'Trending Movies', size: 26, color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 270,
              child: ListView.builder(itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                          vote: trending[index]['vote_average'].toString(),
                          launch_on: trending[index]['release_date'],)));

                      },child:
                    trending[index]['title']!=null? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                ))
                            ),
                          ),
                          Container(
                            child: mtext(text:trending[index]['title']!=null?
                            trending[index]['title']:'loading', color: Colors.white, size: 10,),)
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