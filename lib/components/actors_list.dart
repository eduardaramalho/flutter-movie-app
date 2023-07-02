import 'package:flutter/material.dart';
import 'package:flutter_movie_app/pages/actors_description_page.dart';

class ActorsList extends StatelessWidget {
  final List actorsList;
  final String text;

  const ActorsList({super.key, required this.actorsList, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 800,
            width: double.infinity,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActorsDescriptionPage(
                                    originalName: actorsList[index]
                                        ['original_name'],
                                    profilePath:
                                        'https://image.tmdb.org/t/p/w500${actorsList[index]['profile_path']}',
                                    knownFor: actorsList[index]
                                        ['known_for_department'],
                                    popularity: actorsList[index]['popularity'],
                                  )));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${actorsList[index]['profile_path']}',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(actorsList[index]['name'] ?? 'Loading')
                      ],
                    ),
                  );
                },
                itemCount: actorsList.length),
          )
        ]));
  }
}
