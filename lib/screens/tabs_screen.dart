import 'package:flutter/material.dart';
import 'package:recipes_app/components/main_drawer.dart';
import 'package:recipes_app/models/meal.dart';
import 'package:recipes_app/screens/categories_screen.dart';
import 'package:recipes_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = ['Lista de Categorias', 'Meus Favortios'];
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [CategoriesScreen(), FavoriteScreen(widget.favoriteMeals)];
  }

  _setSelectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titles[_selectedScreenIndex]),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setSelectedScreen,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          )
        ],
      ),
      body: _screens[_selectedScreenIndex],
    );
  }
}
