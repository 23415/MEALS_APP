import "package:riverpod/riverpod.dart";

import "../model/meal.dart";

class FavouriteMealNotifier extends StateNotifier<List<Meal>>{

  FavouriteMealNotifier() : super([]);

  bool toggleFavouriteMeal(Meal meal){
    final bool isFavourite = state.contains(meal);

    if(isFavourite){
      state.where((m) => m.id !=meal.id).toList();
      return false;
    }else{
      state = [...state,meal];
      return true;
    }
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((ref) {
    return FavouriteMealNotifier();
});