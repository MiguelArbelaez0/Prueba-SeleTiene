import '../../data/models/recipe_model.dart';

class Recipe {
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? servings;
  int? readyInMinutes;
  String? license;
  String? sourceName;
  String? sourceUrl;
  String? spoonacularSourceUrl;
  int? healthScore;
  int? spoonacularScore;
  double? pricePerServing;
  List<dynamic>? analyzedInstructions;
  bool? cheap;
  String? creditsText;
  List<dynamic>? cuisines;
  bool? dairyFree;
  List<dynamic>? diets;
  String? gaps;
  bool? glutenFree;
  String? instructions;
  bool? ketogenic;
  bool? lowFodmap;
  List<dynamic>? occasions;
  bool? sustainable;
  bool? vegan;
  bool? vegetarian;
  bool? veryHealthy;
  bool? veryPopular;
  bool? whole30;
  int? weightWatcherSmartPoints;
  List<String>? dishTypes;
  List<ExtendedIngredient>? extendedIngredients;
  String? summary;
  WinePairing? winePairing;
  Recipe({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.servings,
    this.readyInMinutes,
    this.license,
    this.sourceName,
    this.sourceUrl,
    this.spoonacularSourceUrl,
    this.healthScore,
    this.spoonacularScore,
    this.pricePerServing,
    this.analyzedInstructions,
    this.cheap,
    this.creditsText,
    this.cuisines,
    this.dairyFree,
    this.diets,
    this.gaps,
    this.glutenFree,
    this.instructions,
    this.ketogenic,
    this.lowFodmap,
    this.occasions,
    this.sustainable,
    this.vegan,
    this.vegetarian,
    this.veryHealthy,
    this.veryPopular,
    this.whole30,
    this.weightWatcherSmartPoints,
    this.dishTypes,
    this.extendedIngredients,
    this.summary,
    this.winePairing,
  });
}
