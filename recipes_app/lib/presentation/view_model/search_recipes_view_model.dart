import 'package:flutter/material.dart';
import 'package:recipes_app/domain/use_cases/search_recipes_use_cases.dart';

class SearchRecipesViewModel extends SearchDelegate {
  final SearchRecipesUsesCases _searchRecipesUsesCases;

  SearchRecipesViewModel({SearchRecipesUsesCases? searchRecipesUsesCases})
      : _searchRecipesUsesCases =
            searchRecipesUsesCases ?? SearchRecipesUsesCases();

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
