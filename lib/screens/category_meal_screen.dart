import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';

import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = 'category_meals';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings;
    Map<String, String> myMap = routeArg?.arguments as Map<String, String>;

    final categoryId = myMap["id"];
    final categoryTitle = myMap["title"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            affordable: categoryMeals[index].affordable,
            complexity: categoryMeals[index].complexity,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
