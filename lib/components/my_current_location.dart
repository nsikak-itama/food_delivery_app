import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaturant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {


  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final TextEditingController textController = TextEditingController();

  void openLocationSearch(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Your Location"),
        content: TextField(
          decoration: InputDecoration(hintText: "Enter Address..."),
        ),
        actions: [
          MaterialButton(onPressed: () {
            Navigator.pop(context);
            textController.text;
          },
           child: Text("Cancel")
           ),
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context); 
              textController.clear();
            },
            child: Text("Save")
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now", style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          GestureDetector(
            onTap: () => openLocationSearch(context),
            child: Row(
              children: [
                Consumer<Restaurant>(builder: (context, restaurant, child) => Text(
                  restaurant.deliveryAddress, 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold
                  ),
                )),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}