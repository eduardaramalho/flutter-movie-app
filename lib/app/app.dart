import '../pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, primaryColor: Colors.pink
      ),
      routes: {
         AppRoutes.home :(context) => const HomePage()
      },
    );
  }
}