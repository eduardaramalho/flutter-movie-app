import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  final String apiKey = 'a0fd8ad86377b813f72eb4bb0bef6b07';
  final String readAccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGZkOGFkODYzNzdiODEzZjcyZWI0YmIwYmVmNmIwNyIsInN1YiI6IjY0NjAyZWM1YTY3MjU0MDEyMjExYzFlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.htIlamwP_5hYsCdoN5K4Ym9xSeukBMPJCOb6n4c4VhY';

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

    Map trendingResult = await tmdbWithCostumLogs.v3.trending.getTrending();
    print(trendingResult);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie App'),
        backgroundColor: Colors.pink.shade100,
      ),
      body: const Text('data')
      ,
    );
  }
}