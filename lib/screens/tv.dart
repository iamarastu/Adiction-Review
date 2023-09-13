import 'package:flutter/material.dart';
import 'package:movie/screens/series.dart';
import 'package:movie/screens/tvair.dart';
import 'package:movie/screens/tvtop.dart';
import 'package:movie/widgets/util.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}

class tv extends StatefulWidget {
  @override
  State<tv> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<tv> {
  List tvshow = [];
  List airtv=[];
  List awesome=[];

  final String apikey = 'ad8823c48e5e7b0e22ff5570ef912275';
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
    Map tvresult = await logs.v3.tv.getPopular();//this will give the top rated movies name and information
    Map airtoday=await logs.v3.tv.getAiringToday();
    Map awesometv=await logs.v3.tv.getTopRated();
    setState(() {

      tvshow = tvresult['results'];
      airtv=airtoday['results'];
      awesome=awesometv['results'];
    });

    //print(topmovies);
    print(awesometv);


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
            tvtop(top: awesome),
            Tvshows(tseries: tvshow,), //popular
            tvair(todayair: airtv),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }}