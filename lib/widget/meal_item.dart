import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screen/meal_detail.dart';
import 'package:meal_app/widget/meal_item_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
   MealItem({super.key, required this.meals, required this.onClicked});

  final Meal meals;

  String get complexityText{
    return meals.complexity.name[0].toUpperCase()+meals.complexity.name.substring(1);
  }
  String get affordibilityText{
    return meals.affordability.name[0].toUpperCase()+meals.affordability.name.substring(1);
  }

  final void Function(BuildContext context,Meal meal) onClicked;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){
          onClicked(context,meals);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl,),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      meals.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          MealTrait(icon: Icons.access_time, label: '${meals.duration}'+' min'),
                          SizedBox(width: 12,),
                          MealTrait(icon: Icons.monetization_on, label: affordibilityText),
                          SizedBox(width: 12,),
                          MealTrait(icon: Icons.work, label: complexityText)
                      ],
                    )
                  ],
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
