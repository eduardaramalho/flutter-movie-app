import 'package:flutter/material.dart';

class ActorsDescriptionPage extends StatelessWidget {
  
  final String originalName, profilePath, knownFor; 
  final double popularity;

  const ActorsDescriptionPage({super.key, required this.knownFor, required this.originalName, required this.popularity, required this.profilePath});

  @override
  Widget build(BuildContext context) {
    final avaibleHeight = (MediaQuery.of(context).size.width - 30) / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_rounded))
        ],
      ),
          backgroundColor: const Color(0xff303243),
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
                          child: Image.network(
                              profilePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => 
                                Image.network(
                                'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                                fit: BoxFit.fitHeight,
                                height: avaibleHeight,
                              ),                               
                            ),
                        ),
                      ),
                  ]),
            ),
           const SizedBox(height: 15),
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const SizedBox(width: 10),
               Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff15161D),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffFF1F8A)
                    )
                  ),
                  child: Center(child: Text('$popularity%')),
              ),
          Flexible(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  originalName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold
                  ),
                  )
                ),
          ),
             ],
           ),
              const SizedBox(height: 5),
              const Divider(),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text('Profissão: ${knownFor.toString()}', style: const TextStyle(fontSize: 20, fontFamily: 'Inter',))),
              ),
              const SizedBox(height: 10),
            ],
          )
      );
  }
}
