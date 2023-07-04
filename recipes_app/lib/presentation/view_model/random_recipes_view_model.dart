import 'dart:async';

import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../../domain/use_cases/get_random_recipes_use_case.dart';

class RandomRecipesViewModel {
  final GetRandomRecipeUseCase _getRandomRecipeUseCase;

  RandomRecipesViewModel({GetRandomRecipeUseCase? getRandomRecipeUseCase})
      : _getRandomRecipeUseCase =
            getRandomRecipeUseCase ?? GetRandomRecipeUseCase();

  List<Recipe> recipes = [];

  final StreamController<List<Recipe>> _recipesController =
      StreamController.broadcast()..add([]);

  Stream<List<Recipe>> get recipesStream => _recipesController.stream;

  invokeRecipes() async {
    recipes = await _getRandomRecipeUseCase.invokeRandomRecipes();
    _recipesController.add(recipes);
  }
}
