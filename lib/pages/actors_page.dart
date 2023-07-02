import 'package:flutter/material.dart';
import 'package:flutter_movie_app/components/actors_list.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ActorsPage extends StatefulWidget {
  const ActorsPage({super.key});

  @override
  State<ActorsPage> createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  final String apiKey = 'a0fd8ad86377b813f72eb4bb0bef6b07';
  final String readAccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMGZkOGFkODYzNzdiODEzZjcyZWI0YmIwYmVmNmIwNyIsInN1YiI6IjY0NjAyZWM1YTY3MjU0MDEyMjExYzFlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.htIlamwP_5hYsCdoN5K4Ym9xSeukBMPJCOb6n4c4VhY';

  List actorsList = [];
  
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

    Map actorsResult = await tmdbWithCostumLogs.v3.trending.getTrending(mediaType: MediaType.person);

    setState(() {
      actorsList = actorsResult['results'];
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
            ActorsList(actorsList: actorsList, text: 'Atores famosos'),         
          ],
        ),
      ),
    );
  }
}