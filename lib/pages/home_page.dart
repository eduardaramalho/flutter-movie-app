import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/toprated_list.dart';
import 'package:flutter_movie_app/components/trending_list.dart';
import 'package:flutter_movie_app/components/tv_list.dart';
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
    Map topratedresult = await tmdbWithCostumLogs.v3.movies.getTopRated();
    Map tv = await tmdbWithCostumLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingresult['results'];
      topRatedMovies = topratedresult['results'];
      popularTvShows = tv['results'];
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
            TvShowList(tv: popularTvShows),
            TopRatedList(topRated: topRatedMovies),
            TrendingMovies(trending: trendingMovies)
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
               const Divider(),
              ListTile(
                leading: const Icon(Icons.tv),
                title: const Text("Séries"),
                subtitle: const Text("Veja tudo sobre séries."),
                trailing: const Icon(Icons.arrow_forward),
                 onTap: () {
                   
                    },
               ),
               ListTile( 
                 leading: const Icon(Icons.movie),
                 title: const Text("Filmes"),
                  subtitle: const Text("Veja tudo sobre filmes."),
                 trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                }
               )
          ],
        ),
      ),
    );
  }
}