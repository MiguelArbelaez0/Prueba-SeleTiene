import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/models/recipe_model.dart';

import '../services/api_service.dart';

class RecipeDataSource {
  RecipeDataSource();

  Future<RecipeModel> getRecipeInformation(int recipeId) async {
    final Uri url = Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=${ApiService.apiKey}');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return RecipeModel.fromMap(jsonResponse);
    } else {
      throw Exception('Failed to fetch recipe');
    }
  }
}
