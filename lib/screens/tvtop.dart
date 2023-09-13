import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/util.dart';
import 'description.dart';
class tvtop extends StatelessWidget
{

  final List top;


  tvtop({super.key, required this.top});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mtext(text: 'Top Rated Tv Shows', size: 26, color: Colors.white,),
            SizedBox(height: 10,),
            Container(height: 200,
              child: CarouselSlider.builder(itemCount: top.length,
                itemBuilder: (context,index,_){
                  return InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                        name: top[index]['original_name'],
                        description: top[index]['overview'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+top[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+top[index]['poster_path'],
                        vote: top[index]['vote_average'].toString(),
                        launch_on: top[index]['first_air_date'],)));

                    },child: Container(
                    //padding: EdgeInsets.all(5),
                    width: 290,
                    child: Column(
                      children: [
                        Container(
                          width:290,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+(top[index]['backdrop_path']!=null?top[index]['backdrop_path']:''),
                              ),fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          child: mtext(text:top[index]['original_name']!=null?
                          top[index]['original_name']:'loading', color: Colors.white, size: 10,),)
                      ],
                    ),
                  ),
                  );
                }, options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true
                ),),)
          ],
        ),
      ),
    );
  }

}