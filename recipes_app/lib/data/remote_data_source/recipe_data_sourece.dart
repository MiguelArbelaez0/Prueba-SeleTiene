import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/data/services/api_service.dart';

import '../models/recipe_model.dart';

Future<RecipeModel> getRandomRecipes() async {
  final Uri url = Uri.parse(
      "${ApiService.baseUrl}/recipes/random?number=10&apiKey=${ApiService.apiKey}");

  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
  } else {}
}
