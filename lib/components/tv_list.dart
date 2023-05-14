import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/description_page.dart';

class TvShowList extends StatelessWidget {
  final List tv;

  const TvShowList({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Séries mais famosas',
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
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionPage(
                                    name: tv[index]['title'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    description: tv[index]['overview'],
                                    vote: tv[index]['vote_average'].toString(),
                                    launchOn: tv[index]['release_date'],
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                        width: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['poster_path'],),
                                      fit: BoxFit.cover
                            ),
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Text(tv[index]['original_name'] ?? 'Loading')
                      ],
                    ),
                  );
                },
                itemCount: tv.length),
          ),
        ],
      ),
    );
  }
}
