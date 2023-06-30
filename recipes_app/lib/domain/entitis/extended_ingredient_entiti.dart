import 'consistency._entiti.dart';
import 'measures_entiti.dart';

class ExtendedIngredient {
  String aisle;
  double amount;
  Consitency consitency;
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
}
