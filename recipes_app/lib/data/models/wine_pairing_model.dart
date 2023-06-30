import 'dart:convert';

class WinePairingModel {
  factory WinePairingModel.fromJson(String str) =>
      WinePairingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WinePairingModel.fromMap(Map<String, dynamic> json) =>
      WinePairingModel(
        pairedWines: List<String>.from(json["pairedWines"].map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: List<ProductMatch>.from(
            json["productMatches"].map((x) => WinePairingModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pairedWines": List<dynamic>.from(pairedWines.map((x) => x)),
        "pairingText": pairingText,
        "productMatches":
            List<dynamic>.from(productMatches.map((x) => x.toMap())),
      };
}
