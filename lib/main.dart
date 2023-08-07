import 'package:flutter/material.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokedexScreen(),
    );
  }
}

class PokedexScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _pokemonList = [
    {'name': 'Bulbasaur', 'number': '#001', 'type': 'Grass, Poison'},
    {'name': 'Charmander', 'number': '#004', 'type': 'Fire'},
    {'name': 'Squirtle', 'number': '#007', 'type': 'Water'},
    {'name': 'Pikachu', 'number': '#025', 'type': 'Electric'},
    {'name': 'Jigglypuff', 'number': '#039', 'type': 'Normal, Fairy'},
    {'name': 'Geodude', 'number': '#074', 'type': 'Rock, Ground'},
    {'name': 'Eevee', 'number': '#133', 'type': 'Normal'},
    {'name': 'Magikarp', 'number': '#129', 'type': 'Water'},
    {'name': 'Mewtwo', 'number': '#150', 'type': 'Psychic'},
    // Add more Pokemon entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: ListView.builder(
        itemCount: _pokemonList.length,
        itemBuilder: (BuildContext context, int index) {
          final pokemon = _pokemonList[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(pokemon['number']),
            ),
            title: Text(pokemon['name']),
            subtitle: Text('Type: ${pokemon['type']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PokemonDetailScreen(pokemon: pokemon)),
              );
            },
          );
        },
      ),
    );
  }
}

class PokemonDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number: ${pokemon['number']}'),
            Text('Type: ${pokemon['type']}'),
            // Add more details about the Pokemon here
          ],
        ),
      ),
    );
  }
}
