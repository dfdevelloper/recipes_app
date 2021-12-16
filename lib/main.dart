import 'package:flutter/material.dart';
import 'package:recipes_app/data/dummy_data.dart';
import 'package:recipes_app/models/settins.dart';
import 'package:recipes_app/screens/categories_meals_screen.dart';
import 'package:recipes_app/screens/meal_detail_screen.dart';
import 'package:recipes_app/screens/settings_screen.dart';
import 'package:recipes_app/screens/tabs_screen.dart';
import 'package:recipes_app/utils/app_routes.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !filterGluten &&
            !filterLactose &&
            !filterVegetarian &&
            !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      !_favoriteMeals.contains(meal)
          ? _favoriteMeals.add(meal)
          : _favoriteMeals.remove(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(_filterMeals, settings),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => TabsScreen(_favoriteMeals),
        );
      },
    );
  }
}
