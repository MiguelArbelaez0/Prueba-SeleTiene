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
    'Preparation',
    'Ingredients',
    'Nutrition',
  ];
  String getYesNo(bool? value) {
    if (value == true) {
      return 'Sí';
    } else if (value == false) {
      return 'No';
    } else {
      return '';
    }
  }

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
          final extendedIngredients = recipe?.extendedIngredients ?? [];

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
                SizedBox(
                  height: 60,
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
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            _titles[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: _currentPageIndex == index
                                  ? Colors.orange
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
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: extendedIngredients.length,
                          itemBuilder: (context, index) {
                            final ingredient = extendedIngredients[index];
                            final measure = ingredient.measures?.metric ??
                                ingredient.measures?.us;
                            final amount = measure?.amount?.toString() ??
                                ingredient.amount?.toString() ??
                                'Unknown';
                            final unit =
                                measure?.unitShort ?? ingredient.unit ?? '';

                            return ListTile(
                              title: Text(ingredient.name ?? ''),
                              subtitle: Text('Amount: $amount $unit'),
                            );
                          },
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Very Healthy: ${getYesNo(recipe?.veryHealthy)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Suitable for Vegetarians: ${getYesNo(recipe?.vegetarian)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Suitable for Vegans: ${getYesNo(recipe?.vegan)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Gluten-free: ${getYesNo(recipe?.glutenFree)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Dairy-free: ${getYesNo(recipe?.dairyFree)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Low FODMAP: ${getYesNo(recipe?.lowFodmap)}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                    ],
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
