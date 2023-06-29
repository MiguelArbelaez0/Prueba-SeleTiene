import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/models/recipe_model.dart';

import '../services/api_service.dart';

class RecipeDataSource {
  RecipeDataSource();

  Future<List<RecipeModel>> onGetRecipes() async {
    final Uri url = Uri.parse(
        '${ApiService.baseUrl}/recipes/random?apiKey=${ApiService.apiKey}&number=10');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body) as List;
      return responseJson.map((data) => RecipeModel.fromJson(data)).toList();
    } else {
      return <RecipeModel>[];
    }
  }
}
