import 'package:recipes_app/domain/entitis/recipe_entiti.dart';
import 'package:recipes_app/domain/repository/random_recipes.dart';

import '../../data/repository_impl/random_recipes_repository_impl.dart';

class GetRandomRecipeUseCase {
  final RandomRecipesRepository _randomRecipesRepository;

  GetRandomRecipeUseCase({RandomRecipesRepository? randomRecipesRepository})
      : _randomRecipesRepository =
            randomRecipesRepository ?? RandomRecipesRepositoryImpl();

  Future<List<Recipe>> invokeRandomRecipes() async {
    return await _randomRecipesRepository.onGetRandomRecipes();
  }
}
