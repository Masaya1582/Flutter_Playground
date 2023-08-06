import 'package:flutter/material.dart';

void main() {
  runApp(PokemonSearchApp());
}

class PokemonSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonSearchScreen(),
    );
  }
}

class PokemonSearchScreen extends StatefulWidget {
  @override
  _PokemonSearchScreenState createState() => _PokemonSearchScreenState();
}

class _PokemonSearchScreenState extends State<PokemonSearchScreen> {
  List<String> pokemons = [
    'Bulbasaur',
    'Charmander',
    'Squirtle',
    'Pikachu',
    'Jigglypuff',
    'Snorlax',
    'Mewtwo',
    'Gengar',
    'Eevee',
    'Dragonite',
    'Mew',
    'Rayquaza',
  ];

  List<String> filteredPokemons = [];

  void searchPokemon(String value) {
    filteredPokemons = pokemons
        .where((pokemon) => pokemon.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchPokemon,
              decoration: InputDecoration(
                hintText: 'Search Pokémon',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPokemons.length,
              itemBuilder: (context, index) {
                final pokemon = filteredPokemons[index];
                return ListTile(
                  title: Text(pokemon),
                  leading: CircleAvatar(
                    child: Text(
                      pokemon[0],
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
