import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/on_the_air_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../components/components.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  final String apiKey = 'a0fd8ad86377b813f72eb4bb0bef6b07';
  final String readAccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGZkOGFkODYzNzdiODEzZjcyZWI0YmIwYmVmNmIwNyIsInN1YiI6IjY0NjAyZWM1YTY3MjU0MDEyMjExYzFlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.htIlamwP_5hYsCdoN5K4Ym9xSeukBMPJCOb6n4c4VhY';

  List trendingMovies = [];
  List topRatedMovies = [];
  List onTheAirMovies = [];
  
 @override
  void initState(){
    super.initState();
    loadMovies();
  }

  loadMovies () async {
    TMDB tmdbWithCostumLogs = TMDB(
      (ApiKeys(apiKey, readAccesToken)),
      defaultLanguage:'PT-BR',
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true
      )
    );

    Map trendingResult = await tmdbWithCostumLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCostumLogs.v3.movies.getTopRated();
    Map onTheAirResult = await tmdbWithCostumLogs.v3.movies.getNowPlaying();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      onTheAirMovies = onTheAirResult ['results'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff303243),
              Color(0xff36076B),
              Color(0xff8000FF),
            ])
        ),
        child: ListView(
          children: [
            TopRatedList(topRated: topRatedMovies, text: 'Filmes mais votados',),
            TrendingMovies(trending: trendingMovies),
            OnTheAirList(onTheAir: onTheAirMovies, text: 'Filmes no ar')            
          ],
        ),
      ),
    );
  }
}