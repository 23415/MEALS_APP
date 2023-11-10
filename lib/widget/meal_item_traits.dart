import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 20,),
        SizedBox(width: 8,),
        Text(label,style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
