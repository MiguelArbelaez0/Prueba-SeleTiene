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
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => tap.call(),
                child: recipe.image != null
                    ? Image.network(recipe.image!)
                    : const Placeholder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipe.title!,
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
