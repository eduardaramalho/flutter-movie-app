import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/description_page.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filmes em alta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    name: trending[index]['title'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500${trending[index]['backdrop_path']}',
                                    description: trending[index]['overview'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    launchOn: trending[index]['release_date'],
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}'),
                            ),
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Text(trending[index]['name'] ?? 'Loading')
                      ],
                    ),
                  );
                },
                itemCount: trending.length),
          ),
        ],
      ),
    );
  }
}
