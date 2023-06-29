import 'package:recipes_app/data/remote_data_source/recipe_data_sourece.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';
import 'package:recipes_app/domain/repository/recipe_repositoy.dart';

class RecipeInfoRepositoryImpl extends RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeInfoRepositoryImpl({RecipeDataSource? recipeDataSource})
      : _recipeDataSource = recipeDataSource ?? RecipeDataSource();
  @override
  Future<Recipe> getRecipeInformation(int recipeId) async {
    return await _recipeDataSource.getRecipeInformation(recipeId);
  }
}
