import 'package:flutter/material.dart';
import 'json_pokedex.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    Pokedex detalhes = ModalRoute.of(context)!.settings.arguments as Pokedex;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(detalhes.name ?? ''),
      ),
      body: Card(
        margin: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 2,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          '#${detalhes.number}',
                        ),
                      ),
                    ),
                    Image.network(
                      '${detalhes.thumbnailImage}',
                      width: 200,
                      height: 500,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('${detalhes.description}'),
              const SizedBox(height: 20),
              const Text(
                'Tipo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${detalhes.type}',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Fraquezas:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${detalhes.weakness}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
