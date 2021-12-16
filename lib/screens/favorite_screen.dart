import 'package:flutter/material.dart';
import 'package:recipes_app/components/meal_item.dart';
import 'package:recipes_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal: _favoriteMeals[idx]);
        },
      );
    }
  }
}
