import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/domain/entitis/recipe_entiti.dart';

import '../view_model/recipes_view_model.dart';
import 'home_screen.dart';

class DetailScreen extends StatefulWidget {
  final int recipeId;

  const DetailScreen({
    Key? key,
    required this.recipeId,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final RecipesViewModel recipesViewModel;

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
        elevation: 0,
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder<Recipe>(
        stream: recipesViewModel.recipeStream,
        builder: (context, snapshot) {
          final recipe = snapshot.data;
          final instructions =
              recipe?.analyzedInstructions?.first['steps'] ?? [];
          final title = recipe?.title ?? "";
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                recipe?.image != null
                    ? Expanded(
                        child: Image.network(
                          recipe!.image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Placeholder(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   child: PageView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Container(
                //         color: Colors.red,
                //         child: const Center(
                //           child: Text('Ingredients',
                //               style:
                //                   TextStyle(fontSize: 24, color: Colors.white)),
                //         ),
                //       ),
                //       Container(
                //         color: Colors.green,
                //         child: const Center(
                //           child: Text('Preparation',
                //               style:
                //                   TextStyle(fontSize: 24, color: Colors.white)),
                //         ),
                //       ),
                //       Container(
                //         color: Colors.blue,
                //         child: const Center(
                //           child: Text(
                //             'Nutrition',
                //             style: TextStyle(fontSize: 24, color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Instrucciones:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: List.generate(
                            instructions.length,
                            (index) {
                              final step = instructions[index]['step'];
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  '${index + 1}. $step',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
