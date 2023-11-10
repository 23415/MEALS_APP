import 'package:meal_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widget/category_grid_item.dart';

    class CategoryScreen extends StatelessWidget {
      const CategoryScreen({super.key, required this.availableMeal});

      final List<Meal> availableMeal;
      void _onSelected (BuildContext context,Category category){
        List<Meal> meal = availableMeal.where((meal) => meal.categories.contains(category.id)).toList();
        Navigator.push(context,
          MaterialPageRoute(builder: (cxt)=>MealScreen(title: category.title, meals: meal),),);
      }

      @override
      Widget build(BuildContext context) {
        return GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,),
            padding: EdgeInsets.all(16),
            children:  [
              // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
                for(final category in availableCategories)
                    CategoryGridItem(category: category,onSelectCategory: ()=>_onSelected(context,category)),
          ],);
      }
    }
