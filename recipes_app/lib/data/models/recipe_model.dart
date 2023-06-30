class RecipeModel {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}
