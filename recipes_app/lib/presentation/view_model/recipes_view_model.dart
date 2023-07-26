import 'dart:async';

import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../../data/models/recipe_model.dart';
import '../../domain/entitis/search_entiti.dart';
import '../../domain/use_cases/get_random_recipes_use_case.dart';
import '../../domain/use_cases/get_recipes_info_use_cases.dart';
import '../../domain/use_cases/search_recipes_use_cases.dart';

class RecipesViewModel {
  final GetRandomRecipeUseCase _getRandomRecipeUseCase;
  final GetRecipesInfoUseCase _getRecipesInfoUseCase;
  final SearchRecipesUsesCases _searchRecipesUsesCases;

  RecipesViewModel({
    GetRandomRecipeUseCase? getRandomRecipeUseCase,
    GetRecipesInfoUseCase? getRecipesInfoUseCase,
    SearchRecipesUsesCases? searchRecipesUseCases,
  })  : _getRandomRecipeUseCase =
            getRandomRecipeUseCase ?? GetRandomRecipeUseCase(),
        _getRecipesInfoUseCase =
            getRecipesInfoUseCase ?? GetRecipesInfoUseCase(),
        _searchRecipesUsesCases =
            searchRecipesUseCases ?? SearchRecipesUsesCases();

  List<Recipe> recipes = [];

  List<Recipe> recipesResults = [];

  final StreamController<List<Recipe>> _recipesController =
      StreamController.broadcast()..add([]);

  final StreamController<Recipe> _recipeController =
      StreamController<Recipe>.broadcast();

  final StreamController<List<Recipe>> _resultController =
      StreamController<List<Recipe>>.broadcast()..add([]);

  Stream<List<Recipe>> get recipesStream => _recipesController.stream;

  Stream<Recipe> get recipeStream => _recipeController.stream;

  Stream<List<Recipe>> get resultStream => _resultController.stream;

  invokeRecipes() async {
    recipes = await _getRandomRecipeUseCase.invokeRandomRecipes();
    _recipesController.add(recipes);
  }

  invokeRecipesInfo(int recipeId) async {
    Recipe recipe = await _getRecipesInfoUseCase.invokeRecipesInfo(recipeId);
    _recipeController.add(recipe);
  }

  searchRecipes(String query) async {
    if (query.length > 3) {
      SearchRecipe queryResults =
          await _searchRecipesUsesCases.invokeResultsRecipes(query);
      _resultController.add(queryResults.results ?? []);
    }
  }
}
