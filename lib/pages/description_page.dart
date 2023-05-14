import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String name, description, bannerUrl, vote, launchOn, year;

  const DescriptionPage(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.vote,
      required this.launchOn,
      required this.year
      });

  @override
  Widget build(BuildContext context) {
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
                          child: Image.network(bannerUrl, fit: BoxFit.cover,),
                        ),
                      ),
                  // Positioned(
                  //    bottom: 10,
                  //    child: Text('Nota : $vote'),
                  //   ),  
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
                  child: Center(child: Text('$vote%')),
              ),
          Flexible(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '$name | $year ',
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
                    child: Text(description, style: const TextStyle(fontSize: 24))),
              ),
            ],
          )
      );
  }
}
