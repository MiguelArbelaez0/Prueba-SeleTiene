import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/interfaces/home_interfaces.dart';

import '../../domain/entitis/recipe_entiti.dart';

import '../view_model/recipes_view_model.dart';
import 'widgets/recipe_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeInterface {
  late final RecipesViewModel recipesViewModel;

  @override
  void initState() {
    recipesViewModel = RecipesViewModel(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recipesViewModel.invokeRecipes();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Recipe>>(
              stream: recipesViewModel.recipesStream,
              initialData: const [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final List<Recipe> recipes = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecipeWidget(
                      recipe: recipes[index],
                      tap: () {
                        Navigator.pushNamed(
                          context,
                          "/detail_screen",
                          arguments: recipes[index].id,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  hideLoading() {
    Navigator.of(context).pop();

    setState(() {});
  }

  @override
  showLoading() {
    AlertDialog loadingDialog = const AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: CircularProgressIndicator(),
    );

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return loadingDialog;
      },
    );
  }
}
