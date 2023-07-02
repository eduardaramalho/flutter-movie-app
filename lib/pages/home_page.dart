import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/movie_page.dart';
import 'package:flutter_movie_app/pages/pages.dart';
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
  List popularTvShows = [];
  List actors = [];
  
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

    Map trendingresult = await tmdbWithCostumLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCostumLogs.v3.movies.getTopRated();
    Map tv = await tmdbWithCostumLogs.v3.tv.getPopular();
    // Map actors = await tmdbWithCostumLogs.v3.

    setState(() {
      trendingMovies = trendingresult['results'];
      topRatedMovies = topratedresult['results'];
      popularTvShows = tv['results'];
    });

  }

  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MoviePage(),
    const TvShowPage(),
    const ActorsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie App', style: TextStyle(fontFamily: 'Inter'),),
        backgroundColor: const Color(0xff303243),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: "Filmes"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: "Séries"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Atores"
          ),
        ],
      ),
    );
  }
}