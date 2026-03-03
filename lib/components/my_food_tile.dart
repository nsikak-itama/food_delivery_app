import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyFoodItem extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodItem({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text('\$' + food.price.toString(), style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                      SizedBox(height: 10),
                      Text(food.decsription, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),)
                    ],
                  )
                ),
                SizedBox(width: 15),
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagePath, height: 120)
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}