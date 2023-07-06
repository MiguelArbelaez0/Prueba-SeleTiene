import '../entitis/recipe_entiti.dart';

abstract class RecipesInfoRepository {
  Future<Recipe> onGetRecipeInfo(int recipeId);
}
