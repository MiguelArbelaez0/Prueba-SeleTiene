import '../../data/models/search_model.dart';

class SearchRecipe {
  int? offset;
  int? number;
  List<Result>? results;
  int? totalResults;
  SearchRecipe({
    this.offset,
    this.number,
    this.results,
    this.totalResults,
  });
}
