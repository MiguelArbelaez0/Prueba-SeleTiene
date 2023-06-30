import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/services/api_service.dart';

import '../models/recipe_model.dart';

Future<RecipeModel> fetchRandomRecipe() async {
  final response = await http.get(Uri.parse(
      'https://api.spoonacular.com/recipes/random?apiKey=${ApiService.apiKey}'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    return RecipeModel.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch random recipe');
  }
}
