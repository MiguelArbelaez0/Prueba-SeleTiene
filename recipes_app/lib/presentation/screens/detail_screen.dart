import 'package:flutter/material.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../view_model/recipes_view_model.dart';

class DetailScreen extends StatefulWidget {
  final int recipeId;

  const DetailScreen({
    super.key,
    required this.recipeId,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final RecipesViewModel recipesViewModel;

  Recipe? recipe;

  @override
  void initState() {
    super.initState();
    recipesViewModel = RecipesViewModel();
    recipesViewModel.invokeRecipesInfo(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: StreamBuilder<Recipe?>(
        stream: recipesViewModel.recipeStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Aquí puedes mostrar los detalles de la receta en función de los datos recibidos.
            return Center(
              child: Text('Detalles de la receta: ${snapshot.data}'),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al cargar los detalles de la receta.'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
