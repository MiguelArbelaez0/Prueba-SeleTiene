import 'dart:convert';

import 'package:recipes_app/data/models/recipe_model.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';
import 'package:recipes_app/domain/entitis/search_entiti.dart';

SearchModel searchModelFromMap(String str) =>
    SearchModel.fromMap(json.decode(str));

String searchModelToMap(SearchModel data) => json.encode(data.toMap());

class SearchModel extends SearchRecipe {
  SearchModel({
    int? offset,
    int? number,
    List<RecipeModel>? results,
    int? totalResults,
  }) : super(
          offset: offset,
          number: number,
          results: results,
          totalResults: totalResults,
        );

  factory SearchModel.fromMap(Map<String, dynamic> json) => SearchModel(
        offset: json["offset"],
        number: json["number"],
        results: json["results"] == null
            ? []
            : List<RecipeModel>.from(
                json["results"]!.map((x) => RecipeModel.fromMap(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "number": number,
        "results": results == null ? [] : [],
        "totalResults": totalResults,
      };
}

class Result {
  int? id;
  String? title;
  String? image;
  String? imageType;

  Result({
    this.id,
    this.title,
    this.image,
    this.imageType,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
      };
}
