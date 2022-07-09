import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'json_pokedex.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Pokedex> pokedexList = [];

  @override
  void initState() {
    _getPokedex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: const Text(
          'Pokedex',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.network(
              'https://cdn.pixabay.com/photo/2016/09/01/09/31/pokemon-1635610_1280.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: pokedexList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/itens', arguments: pokedexList[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Image.network(
                            pokedexList[index].thumbnailImage ?? '',
                            width: 80,
                            height: 80,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            pokedexList[index].name ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          '#${pokedexList[index].number ?? ''}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _getPokedex() {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    http.get(url).then((value) {
      if (value.statusCode == 200) {
        Map json = const JsonDecoder().convert(value.body);

        for (var element in (json['data'] as List)) {
          pokedexList.add(Pokedex.fromJson(element));
        }
      }
    });
  }
}
