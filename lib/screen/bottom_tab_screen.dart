import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/provider/favourite_provider.dart';
import 'package:meal_app/provider/meals_provider.dart';

import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widget/main_drawer.dart';
import '../model/meal.dart';
import '../provider/filter_provider.dart';


class BottomTabScreen extends ConsumerStatefulWidget {
  const BottomTabScreen({super.key});

  @override
  ConsumerState<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends ConsumerState<BottomTabScreen> {

  int _selectedIndex = 0;

  void _onClicked(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSelectScreen(String s)  {
    Navigator.of(context).pop();
    if (s == 'Filter') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FilterScreen(
                  ),),);
    }
  }


  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final availableFilter = ref.watch(filterProvider);
    final availableMeals = meals.where((element) {
      if (availableFilter[Filter.glutenFree]! && !element.isGlutenFree)
        return false;
      if (availableFilter[Filter.vegan]! && !element.isVegan) return false;
      if (availableFilter[Filter.vegetarian]! && !element.isVegetarian)
        return false;
      if (availableFilter[Filter.lactoseFree]! && !element.isLactoseFree)
        return false;
      return true;
    }).toList();
    Widget _activePage = CategoryScreen(
      availableMeal: availableMeals,
    );
    String _activePageTitle = 'Category';
    if (_selectedIndex == 1) {
      final favouriteMeal = ref.watch(favouriteProvider);
      setState(() {
        _activePage = MealScreen(
          meals: favouriteMeal,
        );
        _activePageTitle = 'Favourite';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelectScreen),
      body: _activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onClicked,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
