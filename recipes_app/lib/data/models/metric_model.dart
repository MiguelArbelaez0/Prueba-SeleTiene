import 'dart:convert';

class MetricModel {
  factory MetricModel.fromJson(String str) =>
      MetricModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetricModel.fromMap(Map<String, dynamic> json) => MetricModel(
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
