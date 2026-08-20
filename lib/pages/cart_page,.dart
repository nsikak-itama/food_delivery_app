import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_tile.dart';
import 'package:food_delivery_app/models/restaturant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      final userCart = restaurant.cart;

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background ,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("cart"),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (context) => AlertDialog(
                    title: Text("Are you sure you want to clear tthe cart?"),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
                      TextButton(
                        onPressed: ()=> {
                          Navigator.pop(context),
                          restaurant.clearCart()
                        }, 
                        child: Text("Yes")
                      )
                    ],
                  )
                );
              }, 
              icon: Icon(Icons.delete)
            )
          ],
        ),
        body:  Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ? Expanded(child: Center(child: Text("Your Cart is empty", style: TextStyle(fontSize: 20),))) :
                  Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = userCart[index];
                        return MyCartTile(cartItem: cartItem, onPressed: () =>  restaurant.removeFromCart(cartItem),);
                      }
                    )
                  )
                ],
              ),
            ),
            MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage())), text: "Go to checkout"),
            SizedBox(height: 10,)
          ],
        ),
      );
    });
  }
}