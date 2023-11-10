import 'package:riverpod/riverpod.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{

  FilterNotifier() : super(
      {
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
      }
  );

  void filterMeals(Map<Filter,bool> filters){
    state=filters;
  }

  void filterMeal(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref){
  return FilterNotifier();
});