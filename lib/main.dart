import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/screens/TopRatedMovie.dart';
import 'package:movie/screens/admin.dart';
import 'package:movie/screens/spash.dart';
import 'package:movie/screens/TrendingMovies.dart';
import 'package:movie/screens/upcomingmv.dart';
import 'package:movie/widgets/util.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List tmovie = [];
  List topratedmovies = [];
  List tvshow = [];
  List upcoming =[];
  List airtv=[];

  final String apikey = 'hhh';
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZDg4MjNjNDhlNWU3YjBlMjJmZjU1NzBlZjkxMjI3NSIsInN1YiI6IjY0YzI1ZTg4ZGY4NmE4MDE0NDZjOTRiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QfjEdAUr7roDDsEsdIdG-JU0MaFzi0C2wMgpb6jUoBM';
  //String query="";

  initState() {
    super.initState();
    loadmovies();
  }


  loadmovies() async {
    TMDB logs = TMDB(ApiKeys(apikey, token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await logs.v3.trending
        .getTrending(); //this will give the trending movies name and information
    Map topmovies = await logs.v3.movies
        .getTopRated(); //this will give the top rated movies name and information
    Map tvresult = await logs.v3.tv.getPopular();//this will give the top rated movies name and information
    Map upcome=await logs.v3.movies.getUpcoming();
    Map airtoday=await logs.v3.tv.getAiringToday();

    setState(() {
      topratedmovies = topmovies['results'];
      tmovie = trendingresult['results'];
      tvshow = tvresult['results'];
      upcoming=upcome['results'];
      airtv=airtoday['results'];
    });

    //print(topmovies);
    //print(trendingresult);


  }
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

        body: SingleChildScrollView(
          child: Column(
            children: [
              TopRatedMovie(toprated: topratedmovies,),
              TrendingMovies(trending: tmovie),
              upcomingmv(up: upcoming),

            ],
          ),
        ),
      // This trailing comma makes auto-formatting nicer for build methods.
        );
  }}