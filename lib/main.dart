import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeListScreen(),
    );
  }
}

class Recipe {
  final String name;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Pasta with Tomato Sauce',
      image:
          'https://masasophi.com/wp-content/uploads/2023/05/normal_swift.001.png',
      ingredients: ['Pasta', 'Tomato Sauce', 'Olive Oil', 'Garlic', 'Salt'],
      instructions: [
        'Boil pasta in salted water.',
        'In a separate pan, sauté garlic in olive oil.',
        'Add tomato sauce to the pan and let it simmer.',
        'Drain the pasta and add it to the sauce.',
        'Toss everything together and serve hot.',
      ],
    ),
    Recipe(
      name: 'Chicken Stir-Fry',
      image:
          'https://masasophi.com/wp-content/uploads/2023/05/swiftui_image.001.png',
      ingredients: ['Chicken', 'Broccoli', 'Bell Peppers', 'Soy Sauce'],
      instructions: [
        'Cut chicken and vegetables into bite-sized pieces.',
        'Stir-fry chicken in a hot pan.',
        'Add vegetables and soy sauce to the pan.',
        'Cook until chicken is fully cooked and vegetables are tender.',
        'Serve hot with rice or noodles.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            leading: Image.network(recipe.image),
            title: Text(recipe.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(recipe.image),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                for (String ingredient in recipe.ingredients)
                  Text('- $ingredient'),
                SizedBox(height: 16.0),
                Text(
                  'Instructions:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 8.0),
                for (int i = 0; i < recipe.instructions.length; i++)
                  Text('${i + 1}. ${recipe.instructions[i]}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
