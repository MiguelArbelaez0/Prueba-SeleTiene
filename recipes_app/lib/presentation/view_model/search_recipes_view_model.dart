import 'package:flutter/material.dart';
import 'package:recipes_app/domain/use_cases/search_recipes_use_cases.dart';

class SearchRecipesViewModel extends SearchDelegate {
  final SearchRecipesUsesCases _searchRecipesUsesCases;

  SearchRecipesViewModel({SearchRecipesUsesCases? searchRecipesUsesCases})
      : _searchRecipesUsesCases =
            searchRecipesUsesCases ?? SearchRecipesUsesCases();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
