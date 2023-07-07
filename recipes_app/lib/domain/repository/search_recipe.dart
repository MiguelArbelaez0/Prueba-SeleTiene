import '../entitis/search_entiti.dart';

abstract class SearchRecipeRepository {
  Future<SearchRecipe> onGetResultSearch(String query);
}
