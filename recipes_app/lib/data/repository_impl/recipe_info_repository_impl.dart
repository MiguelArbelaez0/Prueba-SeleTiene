import 'package:recipes_app/data/remote_data_source/recipe_info_data_source.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';
import 'package:recipes_app/domain/repository/get_recipes_info.dart';

class RecipeInfoRepositoryImpl extends RecipesInfoRepository {
  final RecipeDataInformationSource _recipeDataInformationSource;

  RecipeInfoRepositoryImpl(
      {RecipeDataInformationSource? recipeDataInformationSource})
      : _recipeDataInformationSource =
            recipeDataInformationSource ?? RecipeDataInformationSource();

  @override
  Future<Recipe> onGetRecipeInfo(int recipeId) async {
    return await _recipeDataInformationSource.getRecipeInformation(recipeId);
  }
}
