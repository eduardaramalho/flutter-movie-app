import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/description_page.dart';

class OnTheAirList extends StatelessWidget {
  final List onTheAir;
  final String text;

  const OnTheAirList({super.key, required this.onTheAir, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                    name: onTheAir[index]['name'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500${onTheAir[index]['poster_path']}',
                                    description: onTheAir[index]['overview'],
                                    vote: onTheAir[index]['vote_average'].toString(),
                                    launchOn: onTheAir[index]['first_air_date'],
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${onTheAir[index]['poster_path']}'),
                            ),
                          ),
                          height: 200,
                        ),
                        const SizedBox(height: 5),
                        Text(onTheAir[index]['original_title'] ?? 'Loading')
                      ],
                    ),
                  );
                },
                itemCount: onTheAir.length),
          ),
        ],
      ),
    );
  }
}
