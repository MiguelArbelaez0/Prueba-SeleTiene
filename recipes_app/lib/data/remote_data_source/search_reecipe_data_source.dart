import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:recipes_app/data/models/search_model.dart';

class SearchRecipeDataSource {
  SearchRecipeDataSource();
  Future<SearchModel> searchRecipes(String query) async {
    final Uri url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=eefb513a794042d7adbad45894a2f239&number=100');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return SearchModel.fromMap(responseJson);
    } else {
      throw Exception('Error en la solicitud');
    }
  }
}
