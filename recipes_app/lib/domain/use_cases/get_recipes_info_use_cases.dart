import 'package:recipes_app/data/repository_impl/recipe_info_repository_impl.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';
import 'package:recipes_app/domain/repository/get_recipes_info.dart';

class GetRecipesInfoUseCase {
  final RecipesInfoRepository _recipesInfoRepository;

  GetRecipesInfoUseCase({RecipesInfoRepository? recipesInfoRepository})
      : _recipesInfoRepository =
            recipesInfoRepository ?? RecipeInfoRepositoryImpl();

  Future<Recipe> invokeRecipesInfo(int recipeId) async {
    return await _recipesInfoRepository.onGetRecipeInfo(recipeId);
  }
}
