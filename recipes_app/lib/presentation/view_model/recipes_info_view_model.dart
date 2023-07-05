import '../../domain/use_cases/get_recipes_info_use_cases.dart';

class RecipesInfoViewModel {
  final GetRecipesInfoUseCase _getRecipesInfoUseCase;

  RecipesInfoViewModel({GetRecipesInfoUseCase? getRecipesInfoUseCase})
      : _getRecipesInfoUseCase =
            getRecipesInfoUseCase ?? GetRecipesInfoUseCase();

  invokeRecipesInfo(int recipeId) async {
    _getRecipesInfoUseCase.invokeRecipesInfo(recipeId);
  }
}
