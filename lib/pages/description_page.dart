import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String name, description, bannerUrl, vote, launchOn;

  const DescriptionPage(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.vote,
      required this.launchOn
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                  child: SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(bannerUrl, fit: BoxFit.cover,),
                        ),
                      ),
                  Positioned(
                     bottom: 10,
                     child: Text('Nota : $vote'),
                    ),  
                  ]),
            ),
           const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(10),
              child: Text(name, style: const TextStyle(fontSize: 24))),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child:
                 Text('Data de estreia: $launchOn', style: const TextStyle(fontSize: 24))),
              const SizedBox(height: 5),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(description, style: const TextStyle(fontSize: 24))),
              ),
            ],
          )
      );
  }
}
