import 'dart:convert';

import 'package:http/http.dart' as http;

// class RecipeDataInformationSource {
//   RecipeDataInformationSource();
//   Future<void> fetchRecipeInformation(int recipeId) async {
//     final Uri url = Uri.parse(
//         'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=eefb513a794042d7adbad45894a2f239');

//     final http.Response response = await http.get(url);

//     if (response.statusCode == 200) {
//       var responseJson = json.decode(response.body);
//       return responseJson;
//     } else {
//       print('Error en la solicitud');
//     }
//   }
// }
class RecipeDataInformationSource {
  RecipeDataInformationSource();

  Future<void> getRecipeInformation(int recipeId) async {
    final Uri url = Uri.parse(
        'https://api.spoonacular.com/recipes/$recipeId/information?apiKey=eefb513a794042d7adbad45894a2f239');

    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print(responseJson);
    } else {
      print('Error en la solicitud');
    }
  }
}
