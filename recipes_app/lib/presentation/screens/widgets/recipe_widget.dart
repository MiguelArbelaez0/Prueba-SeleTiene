import 'package:flutter/material.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback tap;
  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: GestureDetector(
        onTap: () => tap.call(),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                recipe.image != null
                    ? Image.network(
                        recipe.image!,
                        fit: BoxFit.cover,
                      )
                    : const Placeholder(),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          recipe.title!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
