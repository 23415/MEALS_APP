import 'package:flutter/material.dart';

import '../model/meal.dart';


class MealADDitionalDetail extends StatelessWidget {
  const MealADDitionalDetail({super.key, required this.title, required this.meal, required this.lable});

  final String title;
  final Meal meal;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Text(title),
        SizedBox(height: 12,),
        for(final ind in meal.ingredients)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ind.toString(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white
            ),),
          ),
      ],
    );
  }
}
