import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filter_provider.dart';



class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key,});


  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _isGlutenFilter = false;
  var _isVegatarianFilter = false;
  var _isVeganFilter = false;
  var _isLactoseFilter = false;
  @override
  void initState() {
    super.initState();
    final finalFilter = ref.read(filterProvider);
    _isGlutenFilter = finalFilter[Filter.glutenFree]!;
    _isVegatarianFilter = finalFilter[Filter.vegetarian]!;
    _isVeganFilter = finalFilter[Filter.vegan]!;
    _isLactoseFilter = finalFilter[Filter.lactoseFree]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      body: WillPopScope(
        onWillPop: () async{
          ref.read(filterProvider.notifier).filterMeals({
            Filter.glutenFree : _isGlutenFilter,
            Filter.lactoseFree : _isLactoseFilter,
            Filter.vegan : _isVeganFilter,
            Filter.vegetarian : _isVegatarianFilter,
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(value: _isGlutenFilter, onChanged: (value){
              setState(() {
                _isGlutenFilter=!_isGlutenFilter;
              });
            },
              title: Text('Gluten-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
              ),),
            subtitle: Text('Complete Gluten-Free'),),
            SwitchListTile(value: _isVeganFilter, onChanged: (value){
              setState(() {
                _isVeganFilter=!_isVeganFilter;
              });
            },
              title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
              ),),
              subtitle: Text('Complete vegan Food'),),
            SwitchListTile(value: _isVegatarianFilter, onChanged: (value){
              setState(() {
                _isVegatarianFilter=!_isVegatarianFilter;
              });
            },
              title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
              ),),
              subtitle: Text('Completely Vegetarian Food'),),
            SwitchListTile(value: _isLactoseFilter, onChanged: (value){
              setState(() {
                _isLactoseFilter=!_isLactoseFilter;
              });
            },
              title: Text('Lactose-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24
              ),),
              subtitle: Text('Completely Lactose-Free'),),
          ],
        ),
      ),
    );
  }
}
