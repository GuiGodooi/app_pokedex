import 'package:app_pokedex_1/pokemon_descrip.dart';
import 'package:app_pokedex_1/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPrincipal(),
      routes: {
        '/home': (context) => const TelaPrincipal(),
        '/itens': (context) => const Description(),
      },
    );
  }
}