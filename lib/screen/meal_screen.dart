import 'package:flutter/material.dart';
import 'package:meal_app/screen/meal_detail.dart';
import 'package:meal_app/widget/meal_item.dart';

import '../model/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _onCLicked(BuildContext context, Meal meal,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (cxt) => MealDetail(
             meal: meal, ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'uh no...nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Try Selecting something else',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (cxt, idx) => MealItem(
          meals: meals[idx],
          onClicked: (context, meal) {
            _onCLicked(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
