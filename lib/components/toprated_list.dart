import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/description_page.dart';

class TopRatedList extends StatelessWidget {
  final List topRated;
  
  const TopRatedList({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text(
              'Filmes mais votados', 
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 5);
                },
                itemBuilder: (context, index) { 
                  return InkWell(
                    onTap: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DescriptionPage(
                                      name: topRated[index]['title'],
                                      bannerUrl: 'https://image.tmdb.org/t/p/w500' +topRated[index]['backdrop_path'],
                                      description: topRated[index]['overview'],
                                      vote: topRated[index]['vote_average']
                                          .toString(),
                                      launchOn: topRated[index]
                                          ['release_date'],
                                    )));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                               image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' + topRated[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                      const SizedBox(height: 5),
                      Text(topRated[index]['title'] ?? 'Loading')
                      ],
                    ),
                  );
                },
                itemCount: topRated.length
                ),
            ),
            
        ],
      ),
    );
  }
}