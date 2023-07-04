import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

abstract class RandomRecipesRepository {
  Future<List<Recipe>> onGetRandomRecipes();
}
