import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class QunatitySelector extends StatelessWidget {

 
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const QunatitySelector({super.key, required this.quantity, required this.food, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onIncrement, icon: Icon(Icons.add, size: 20,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(quantity.toString())
              )
            ),
          ),
          IconButton(onPressed: onDecrement, icon: Icon(Icons.remove, size: 20))
        ],
      ),
    );
  }
}