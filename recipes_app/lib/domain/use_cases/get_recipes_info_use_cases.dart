import 'package:recipes_app/data/repository_impl/recipe_info_repository_impl.dart';
import 'package:recipes_app/domain/repository/get_recipes_info.dart';

class GetRecipesInfoUseCase {
  final RecipesInfoRepository _recipesInfoRepository;

  GetRecipesInfoUseCase({RecipesInfoRepository? recipesInfoRepository})
      : _recipesInfoRepository =
            recipesInfoRepository ?? RecipeInfoRepositoryImpl();

  Future<void> invokeRecipesInfo(int recipeId) async {
    return _recipesInfoRepository.onGetRecipeInfo(recipeId);
  }
}
