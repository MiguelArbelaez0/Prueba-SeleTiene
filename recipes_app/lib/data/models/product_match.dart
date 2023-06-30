import 'dart:convert';

class ProductMatchModel {
  factory ProductMatchModel.fromJson(String str) =>
      ProductMatchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductMatchModel.fromMap(Map<String, dynamic> json) =>
      ProductMatchModel(
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
