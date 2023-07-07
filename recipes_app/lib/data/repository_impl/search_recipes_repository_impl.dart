import 'package:recipes_app/domain/entitis/search_entiti.dart';

import '../../domain/repository/search_recipe.dart';
import '../remote_data_source/search_reecipe_data_source.dart';

class SearchRecipesRepositoryImpl extends SearchRecipeRepository {
  final SearchRecipeDataSource _searchRecipeDataSource;

  SearchRecipesRepositoryImpl({SearchRecipeDataSource? searchRecipeDataSource})
      : _searchRecipeDataSource =
            searchRecipeDataSource ?? SearchRecipeDataSource();

  @override
  Future<SearchRecipe> onGetResultSearch(String query) async {
    return await _searchRecipeDataSource.searchRecipes(query);
  }
}
