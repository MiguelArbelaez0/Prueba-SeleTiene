import 'package:flutter/material.dart';
import 'package:recipes_app/data/models/recipe_model.dart';

import 'package:recipes_app/presentation/screens/home_screen.dart';
import 'package:recipes_app/presentation/screens/nav_screen.dart';

import '../../../domain/entitis/recipe_entiti.dart';
import '../detail_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const NavScreen());
      case "/home_screen":
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // case "/detail_screen":
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return DetailScreen(
      //         recipe: settings.arguments as Recipe,
      //       );
      //     },
      //   );
      case "/detail_screen":
        // Obtener el ID de la receta de los argumentos
        final int recipeId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => DetailScreen(recipeId: recipeId),
        );
    }

    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
