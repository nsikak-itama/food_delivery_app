import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cartItem.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaturant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  final void Function()? onPressed;
  
   MyCartTile({super.key, required this.cartItem, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath, 
                          height: 80, 
                          width: 100,
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem.food.name,overflow: TextOverflow.ellipsis),
                            SizedBox(height: 5),
                            Text('\$' + cartItem.food.price.toString()),
                            SizedBox(height: 5),
                            QunatitySelector(
                              quantity: cartItem.quantity, 
                              food: cartItem.food, 
                              onIncrement: () => restaurant.addToCart(cartItem.food, cartItem.selectedAddons), 
                              onDecrement: () => restaurant.removeFromCart(cartItem)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(onPressed: onPressed, icon: Icon(Icons.delete))
              ],
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: cartItem.selectedAddons.map((addon) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip( 
                    label: Row(
                      children: [
                        Text(addon.name),
                        SizedBox(width: 5),
                        Text('\$' + addon.Price.toString())
                      ],), 
                      shape: StadiumBorder(
                        side: BorderSide(color: Theme.of(context).colorScheme.primary)
                      ),
                      onSelected: (value){},
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 12,   ),
                    ),
                )).toList(),
              ),
            ),

          ],
        ),
      )
    );
  }
}