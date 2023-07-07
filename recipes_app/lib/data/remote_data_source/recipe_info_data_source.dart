import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/models/recipe_model.dart';

class RecipeDataInformationSource {
  RecipeDataInformationSource();
  Future<RecipeModel> getRecipeInformation(int recipeId) async {
    final Uri url = Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=eefb513a794042d7adbad45894a2f239');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return RecipeModel.fromMap(responseJson);
    } else {
      throw Exception('Error en la solicitud');
    }
  }
}
