import 'package:recipes_app/data/repository_impl/search_recipes_repository_impl.dart';
import 'package:recipes_app/domain/entitis/search_entiti.dart';
import 'package:recipes_app/domain/repository/search_recipe.dart';

class SearchRecipesUsesCases {
  final SearchRecipeRepository _searchRecipeRepository;

  SearchRecipesUsesCases({SearchRecipeRepository? searchRecipeRepository})
      : _searchRecipeRepository =
            searchRecipeRepository ?? SearchRecipesRepositoryImpl();

  Future<SearchRecipe> invokeResultsRecipes(String query) async {
    return await _searchRecipeRepository.onGetResultSearch(query);
  }
}
