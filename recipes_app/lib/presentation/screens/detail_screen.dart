import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../interfaces/home_interfaces.dart';
import '../view_model/recipes_view_model.dart';

class DetailScreen extends StatefulWidget {
  final int recipeId;

  const DetailScreen({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final RecipesViewModel recipesViewModel;
  late final HomeInterface _homeInterface;
  @override
  void initState() {
    super.initState();
    recipesViewModel = RecipesViewModel(_homeInterface);
    recipesViewModel.invokeRecipesInfo(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: StreamBuilder<Recipe>(
        stream: recipesViewModel.recipeStream,
        builder: (context, snapshot) {
          final recipe = snapshot.data;
          final instructions = recipe?.instructions ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Vegano: ${recipe?.vegan ?? false}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Vegetariano: ${recipe?.vegetarian ?? false}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Muy saludable: ${recipe?.veryHealthy ?? false}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Instrucciones:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        instructions,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
