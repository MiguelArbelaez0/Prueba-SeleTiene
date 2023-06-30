import 'dart:convert';

class ExtendedIngredientModel {
  factory ExtendedIngredientModel.fromJson(String str) =>
      ExtendedIngredientModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExtendedIngredientModel.fromMap(Map<String, dynamic> json) =>
      ExtendedIngredientModel(
        aisle: json["aisle"],
        amount: json["amount"]?.toDouble(),
        consitency: consitencyValues.map[json["consitency"]]!,
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
        "consitency": consitencyValues.reverse[consitency],
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
