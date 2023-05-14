import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/trending_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String apiKey = 'a0fd8ad86377b813f72eb4bb0bef6b07';
  final String readAccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGZkOGFkODYzNzdiODEzZjcyZWI0YmIwYmVmNmIwNyIsInN1YiI6IjY0NjAyZWM1YTY3MjU0MDEyMjExYzFlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.htIlamwP_5hYsCdoN5K4Ym9xSeukBMPJCOb6n4c4VhY';

  List trendingMovies = [];
  List topRatedMovies = [];
  List upComingMovies = [];
  
 @override
  void initState(){
    super.initState();
    loadMovies();
  }

  loadMovies () async {
    TMDB tmdbWithCostumLogs = TMDB(
      (ApiKeys(apiKey, readAccesToken)),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      )
    );

    Map trendingresult = await tmdbWithCostumLogs.v3.trending.getTrending();
    // Map topRatedMovies = await tmdbWithCostumLogs.v3.movies.getTopRated();
    // Map upComingMovies = await tmdbWithCostumLogs.v3.movies.getUpcoming();

    setState(() {
      trendingMovies = trendingresult['results'];
      // topRatedMovies = topRatedMovies['results'];
      // upComingMovies = upComingMovies['results'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie App'),
        backgroundColor: Colors.pink.shade100,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}