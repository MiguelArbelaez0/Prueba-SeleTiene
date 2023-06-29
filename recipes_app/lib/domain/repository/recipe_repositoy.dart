import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> onGetRecipes();
}
