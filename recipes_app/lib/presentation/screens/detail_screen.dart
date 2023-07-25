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
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  final List<String> _titles = [
    'Ingredients',
    'Preparation',
    'Nutrition',
  ];
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
                Column(
                  children: [
                    // Widget para mostrar los títulos en un ListView horizontal
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _titles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _titles[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _currentPageIndex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  fontWeight: _currentPageIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Widget para mostrar el contenido con PageView
                    SizedBox(
                      height: 200,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(
                            () {
                              _currentPageIndex = index;
                            },
                          );
                        },
                        children: [
                          SingleChildScrollView(
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
                          Container(
                            color: Colors.green,
                            child: const Center(
                              child: Text('Contenido de Preparation',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white)),
                            ),
                          ),
                          Container(
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                'Contenido de Nutrition',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         const Padding(
                //           padding: EdgeInsets.all(20),
                //           child: Text(
                //             'Instrucciones:',
                //             style: TextStyle(
                //               fontSize: 20,
                //               color: Colors.orange,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //         const SizedBox(height: 10),
                //         Column(
                //           children: List.generate(
                //             instructions.length,
                //             (index) {
                //               final step = instructions[index]['step'];
                //               return Padding(
                //                 padding: const EdgeInsets.all(20),
                //                 child: Text(
                //                   '${index + 1}. $step',
                //                   textAlign: TextAlign.start,
                //                   style: const TextStyle(fontSize: 20),
                //                 ),
                //               );
                //             },
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
