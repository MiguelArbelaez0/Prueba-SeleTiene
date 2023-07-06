import 'dart:async';

import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../../domain/use_cases/get_random_recipes_use_case.dart';
import '../../domain/use_cases/get_recipes_info_use_cases.dart';

class RecipesViewModel {
  final GetRandomRecipeUseCase _getRandomRecipeUseCase;
  final GetRecipesInfoUseCase _getRecipesInfoUseCase;

  RecipesViewModel(
      {GetRandomRecipeUseCase? getRandomRecipeUseCase,
      GetRecipesInfoUseCase? getRecipesInfoUseCase})
      : _getRandomRecipeUseCase =
            getRandomRecipeUseCase ?? GetRandomRecipeUseCase(),
        _getRecipesInfoUseCase =
            getRecipesInfoUseCase ?? GetRecipesInfoUseCase();

  List<Recipe> recipes = [];

  final StreamController<List<Recipe>> _recipesController =
      StreamController.broadcast()..add([]);

  final StreamController<Recipe?> _recipeController =
      StreamController<Recipe?>.broadcast();

  Stream<List<Recipe>> get recipesStream => _recipesController.stream;

  Stream<Recipe?> get recipeStream => _recipeController.stream;

  invokeRecipes() async {
    recipes = await _getRandomRecipeUseCase.invokeRandomRecipes();
    _recipesController.add(recipes);
  }

  invokeRecipesInfo(int recipeId) async {
    Recipe recipe = await _getRecipesInfoUseCase.invokeRecipesInfo(recipeId);
    _recipeController.add(recipe);
  }
}
