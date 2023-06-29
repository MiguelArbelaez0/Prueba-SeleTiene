import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/models/recipe_model.dart';

class RecipeDataSourece {
  Future<List<RecipeModel>> onGetRecipe() async {
    Uri url = Uri.parse(" https://api.spoonacular.com/recipes/random");

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responejson = json.decode(response.body) as List;

      return responejson.map((e) => RecipeModel.fromMap(e)).toList();
    } else {
      return <RecipeModel>[];
    }
  }
}
