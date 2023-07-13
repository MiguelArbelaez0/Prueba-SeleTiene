import '../../data/models/recipe_model.dart';

class SearchRecipe {
  int? offset;
  int? number;
  List<RecipeModel>? results;
  int? totalResults;
  SearchRecipe({
    this.offset,
    this.number,
    this.results,
    this.totalResults,
  });
}
