import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/recipe_model.dart';

class RandomRecipeDataSource {
  RandomRecipeDataSource();
  Future<List<RecipeModel>> getRandomRecipes() async {
    final Uri url = Uri.parse(
        'https://api.spoonacular.com/recipes/random?apiKey=eefb513a794042d7adbad45894a2f239&number=6');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body)["recipes"] as List;
      return responseJson.map((recipe) => RecipeModel.fromMap(recipe)).toList();
    } else {
      return [];
    }
  }
}
