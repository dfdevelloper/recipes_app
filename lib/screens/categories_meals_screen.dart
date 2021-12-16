import 'package:flutter/material.dart';
import 'package:recipes_app/components/meal_item.dart';
import 'package:recipes_app/data/dummy_data.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/models/meal.dart';

class CategoriesMealScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealScreen(this.meals);
  
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, idx) {
            return MealItem(meal: categoryMeals[idx]);
          },
        ),
      ),
    );
  }
}
