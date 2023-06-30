import 'package:recipes_app/domain/repository/recipe_repositoy.dart';

import '../../data/repository_impl/recipe_info.dart';
import '../entitis/recipe_entiti.dart';

class GetRecipeInfoUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeInfoUseCase({RecipeRepository? recipeRepository})
      : _recipeRepository = recipeRepository ?? RecipeInfoRepositoryImpl();

  Future<Recipe> invokeGetProductInformation() async {
    return await _recipeRepository.getRecipeInformation();
  }
}
