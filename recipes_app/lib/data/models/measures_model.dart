import 'dart:convert';

import 'package:recipes_app/domain/entitis/measures.dart';

class MeasuresModel {
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
