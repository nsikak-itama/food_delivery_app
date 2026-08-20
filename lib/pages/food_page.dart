import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaturant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}){
    for(Addon addon in food.availableAddon){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons ){
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddon){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
          children: [
            Image.asset(widget.food.imagePath),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.food.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text('\$' + widget.food.price.toString(),style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),),
                  SizedBox(height: 10),
                  Text(widget.food.decsription, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16)),
                  SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  Text(
                    "Addons", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary, 
                      fontSize: 16, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: widget.food.availableAddon.length,
                      itemBuilder: (context, index){
                        Addon addon = widget.food.availableAddon[index];
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('\$' + addon.Price.toString(), style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                          value: widget.selectedAddons[addon], 
                          onChanged: (bool? value){
                            setState(() {
                            widget.selectedAddons[addon] = value!;                            
                            });
                          }
                        );
                      }
                    ),
                  )
              
                ],
              ),
            ),
          
            MyButton(onTap: () => addToCart(widget.food, widget.selectedAddons), text: "Add to cart"),
            SizedBox(height: 25)
          ],
              ),
        )
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Opacity(
          opacity: 0.7,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle),
            child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_rounded)),
          ),
        ),
      )
      ]
    );
  }
}