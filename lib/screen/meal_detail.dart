import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/favourite_provider.dart';

import '../model/meal.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail(
      {super.key,
      required this.meal,});

  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favouriteMeal = ref.watch(favouriteProvider);
    final bool isFavourite = favouriteMeal.contains(meal);

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                final  wasFav = ref.read(favouriteProvider.notifier).toggleFavouriteMeal(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: Text(wasFav ? 'Has been added' : 'Has been removed'),
                    duration: const Duration(
                      seconds: 3,
                    ),
                  ),
                );
              },
              icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border_outlined),
            ),
          ],
        ),
        body: ListView(
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final ind in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ind.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final ind in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ind.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
          ],
        ));
  }
}
