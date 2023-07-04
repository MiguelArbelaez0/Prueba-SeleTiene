import 'dart:convert';

class RecipeModel {
  int id;
  String title;
  String image;
  String imageType;
  int servings;
  int readyInMinutes;
  String license;
  String sourceName;
  String sourceUrl;
  String spoonacularSourceUrl;
  int healthScore;
  int spoonacularScore;
  double pricePerServing;
  List<dynamic> analyzedInstructions;
  bool cheap;
  String creditsText;
  List<dynamic> cuisines;
  bool dairyFree;
  List<dynamic> diets;
  String gaps;
  bool glutenFree;
  String instructions;
  bool ketogenic;
  bool lowFodmap;
  List<dynamic> occasions;
  bool sustainable;
  bool vegan;
  bool vegetarian;
  bool veryHealthy;
  bool veryPopular;
  bool whole30;
  int weightWatcherSmartPoints;
  List<String> dishTypes;
  List<ExtendedIngredient> extendedIngredients;
  String summary;
  WinePairing winePairing;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.servings,
    required this.readyInMinutes,
    required this.license,
    required this.sourceName,
    required this.sourceUrl,
    required this.spoonacularSourceUrl,
    required this.healthScore,
    required this.spoonacularScore,
    required this.pricePerServing,
    required this.analyzedInstructions,
    required this.cheap,
    required this.creditsText,
    required this.cuisines,
    required this.dairyFree,
    required this.diets,
    required this.gaps,
    required this.glutenFree,
    required this.instructions,
    required this.ketogenic,
    required this.lowFodmap,
    required this.occasions,
    required this.sustainable,
    required this.vegan,
    required this.vegetarian,
    required this.veryHealthy,
    required this.veryPopular,
    required this.whole30,
    required this.weightWatcherSmartPoints,
    required this.dishTypes,
    required this.extendedIngredients,
    required this.summary,
    required this.winePairing,
  });

  factory RecipeModel.fromJson(String str) =>
      RecipeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromMap(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
        servings: json["servings"],
        readyInMinutes: json["readyInMinutes"],
        license: json["license"],
        sourceName: json["sourceName"],
        sourceUrl: json["sourceUrl"],
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        healthScore: json["healthScore"],
        spoonacularScore: json["spoonacularScore"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        analyzedInstructions:
            List<dynamic>.from(json["analyzedInstructions"].map((x) => x)),
        cheap: json["cheap"],
        creditsText: json["creditsText"],
        cuisines: List<dynamic>.from(json["cuisines"].map((x) => x)),
        dairyFree: json["dairyFree"],
        diets: List<dynamic>.from(json["diets"].map((x) => x)),
        gaps: json["gaps"],
        glutenFree: json["glutenFree"],
        instructions: json["instructions"],
        ketogenic: json["ketogenic"],
        lowFodmap: json["lowFodmap"],
        occasions: List<dynamic>.from(json["occasions"].map((x) => x)),
        sustainable: json["sustainable"],
        vegan: json["vegan"],
        vegetarian: json["vegetarian"],
        veryHealthy: json["veryHealthy"],
        veryPopular: json["veryPopular"],
        whole30: json["whole30"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
        extendedIngredients: List<ExtendedIngredient>.from(
            json["extendedIngredients"]
                .map((x) => ExtendedIngredient.fromMap(x))),
        summary: json["summary"],
        winePairing: WinePairing.fromMap(json["winePairing"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
        "servings": servings,
        "readyInMinutes": readyInMinutes,
        "license": license,
        "sourceName": sourceName,
        "sourceUrl": sourceUrl,
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "healthScore": healthScore,
        "spoonacularScore": spoonacularScore,
        "pricePerServing": pricePerServing,
        "analyzedInstructions":
            List<dynamic>.from(analyzedInstructions.map((x) => x)),
        "cheap": cheap,
        "creditsText": creditsText,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
        "dairyFree": dairyFree,
        "diets": List<dynamic>.from(diets.map((x) => x)),
        "gaps": gaps,
        "glutenFree": glutenFree,
        "instructions": instructions,
        "ketogenic": ketogenic,
        "lowFodmap": lowFodmap,
        "occasions": List<dynamic>.from(occasions.map((x) => x)),
        "sustainable": sustainable,
        "vegan": vegan,
        "vegetarian": vegetarian,
        "veryHealthy": veryHealthy,
        "veryPopular": veryPopular,
        "whole30": whole30,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
        "extendedIngredients":
            List<dynamic>.from(extendedIngredients.map((x) => x.toMap())),
        "summary": summary,
        "winePairing": winePairing.toMap(),
      };
}

class ExtendedIngredient {
  String aisle;
  double amount;
  String consitency;
  int id;
  String image;
  Measures measures;
  List<String> meta;
  String name;
  String original;
  String originalName;
  String unit;

  ExtendedIngredient({
    required this.aisle,
    required this.amount,
    required this.consitency,
    required this.id,
    required this.image,
    required this.measures,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(String str) =>
      ExtendedIngredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExtendedIngredient.fromMap(Map<String, dynamic> json) =>
      ExtendedIngredient(
        aisle: json["aisle"],
        amount: json["amount"]?.toDouble(),
        consitency: json["consitency"],
        id: json["id"],
        image: json["image"],
        measures: Measures.fromMap(json["measures"]),
        meta: List<String>.from(json["meta"].map((x) => x)),
        name: json["name"],
        original: json["original"],
        originalName: json["originalName"],
        unit: json["unit"],
      );

  Map<String, dynamic> toMap() => {
        "aisle": aisle,
        "amount": amount,
        "consitency": consitency,
        "id": id,
        "image": image,
        "measures": measures.toMap(),
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "name": name,
        "original": original,
        "originalName": originalName,
        "unit": unit,
      };
}

class Measures {
  Metric metric;
  Metric us;

  Measures({
    required this.metric,
    required this.us,
  });

  factory Measures.fromJson(String str) => Measures.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Measures.fromMap(Map<String, dynamic> json) => Measures(
        metric: Metric.fromMap(json["metric"]),
        us: Metric.fromMap(json["us"]),
      );

  Map<String, dynamic> toMap() => {
        "metric": metric.toMap(),
        "us": us.toMap(),
      };
}

class Metric {
  double amount;
  String unitLong;
  String unitShort;

  Metric({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory Metric.fromJson(String str) => Metric.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metric.fromMap(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitLong: json["unitLong"],
        unitShort: json["unitShort"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "unitLong": unitLong,
        "unitShort": unitShort,
      };
}

class WinePairing {
  List<String> pairedWines;
  String pairingText;
  List<ProductMatch> productMatches;

  WinePairing({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });

  factory WinePairing.fromJson(String str) =>
      WinePairing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WinePairing.fromMap(Map<String, dynamic> json) => WinePairing(
        pairedWines: List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: List<ProductMatch>.from(
            json["productMatches"].map((x) => ProductMatch.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pairedWines": List<dynamic>.from(pairedWines.map((x) => x)),
        "pairingText": pairingText,
        "productMatches":
            List<dynamic>.from(productMatches.map((x) => x.toMap())),
      };
}

class ProductMatch {
  int id;
  String title;
  String description;
  String price;
  String imageUrl;
  double averageRating;
  int ratingCount;
  double score;
  String link;

  ProductMatch({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.averageRating,
    required this.ratingCount,
    required this.score,
    required this.link,
  });

  factory ProductMatch.fromJson(String str) =>
      ProductMatch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductMatch.fromMap(Map<String, dynamic> json) => ProductMatch(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        averageRating: json["averageRating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        score: json["score"]?.toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "averageRating": averageRating,
        "ratingCount": ratingCount,
        "score": score,
        "link": link,
      };
}
