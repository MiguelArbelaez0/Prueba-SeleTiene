import '../entitis/recipe_entiti.dart';

abstract class RecipeRepository {
  Future<Recipe> getRecipeInformation(int recipeId);
}
