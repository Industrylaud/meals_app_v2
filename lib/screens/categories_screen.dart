import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;

  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  void _selectCategory(BuildContext context, Category category) {
    final meals =
        dummyMeals.where((element) => element.categories.contains(category.id));

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: meals.toList(),
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
