import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cartItem.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    // burgers
    Food(
      "Cheese Burger", 
      "A juicy beef patty with melted cheddar, lettuce, tomoato, and a hint of onion and pickle", 
      "images/burgers/cheese_burger.png", 
      60.00, 
      FoodCategory.burgers, 
      [
        Addon(name: "Extra cheese", Price: 0.99),
        Addon(name: "Bacon", Price: 1.99),
        Addon(name: "Avocado", Price: 2.99)
      ]
    ),

    Food(
      "Aloha Burger", 
      "A juicy beef patty topped with grilled pineapple, crispy bacon, fresh lettuce, and teriyaki glaze for a sweet and savory island-inspired bite", 
      "images/burgers/aloha_burer.png", 
      40.50, 
      FoodCategory.burgers, 
      [
        Addon(name: "raisins", Price: 0.99),
        Addon(name: "pickles", Price: 1.99),
        Addon(name: "Avocado", Price: 2.99)
      ]
    ),

    Food(
      "bbq Burger", 
      "Flame-grilled beef layered with smoky barbecue sauce, crispy onion rings, cheddar cheese, and fresh lettuce for bold, backyard flavor.",
      "images/burgers/bbq_burger.png", 
      30.50, 
      FoodCategory.burgers, 
      [
        Addon(name: "raisins", Price: 0.99),
        Addon(name: "bacon", Price: 1.99),
        Addon(name: "onions", Price: 2.99)
      ]
    ),

    Food(
      "Veggie burger", 
      "A hearty plant-based patty topped with fresh lettuce, tomato, red onion, and creamy sauce for a satisfying meat-free option",
      "images/burgers/vege.png", 
      30.50, 
      FoodCategory.burgers, 
      [
        Addon(name: "raisins", Price: 0.99),
        Addon(name: "bacon", Price: 1.99),
        Addon(name: "onions", Price: 2.99)
      ]
    ),

    Food(
      "Bluemoon burger", 
      "A rich beef patty topped with melted blue cheese, caramelized onions, and fresh greens for a creamy, savory kick",
      "images/burgers/bluemoon_burger.png", 
      51.25, 
      FoodCategory.burgers, 
      [
        Addon(name: "raisins", Price: 0.99),
        Addon(name: "bacon", Price: 1.99),
        Addon(name: "onions", Price: 2.99)
      ]
    ),


    // desserts
    Food(
      "Apple pie", 
      "Warm spiced apples baked in flaky golden crust",
      "images/desserts/applepie.png", 
      51.25, 
      FoodCategory.desserts, 
      [
        Addon(name: "berries", Price: 0.99),
        Addon(name: "syrup", Price: 1.99),
        Addon(name: "honey", Price: 2.99)
      ]
    ),

    Food(
      "Chocolate Lava Cake", 
      "Rich chocolate cake with warm, gooey center.",
      "images/desserts/chocolate_cake.png", 
      40.00, 
      FoodCategory.desserts, 
      [
        Addon(name: "berries", Price: 0.99),
        Addon(name: "syrup", Price: 1.99),
        Addon(name: "honey", Price: 2.99)
      ]
    ),

    Food(
      "Cheesecake", 
      "Creamy baked cheesecake with smooth, velvety texture.",
      "images/desserts/cheesecake.png", 
      50.00, 
      FoodCategory.desserts, 
      [
        Addon(name: "berries", Price: 0.99),
        Addon(name: "syrup", Price: 1.99),
        Addon(name: "honey", Price: 2.99)
      ]
    ),

    Food(
      "Brownies", 
      "Fudgy chocolate squares, rich and perfectly baked.",
      "images/desserts/brownies.png", 
      30.00, 
      FoodCategory.desserts, 
      [
        Addon(name: "berries", Price: 0.99),
        Addon(name: "syrup", Price: 1.99),
        Addon(name: "honey", Price: 2.99)
      ]
    ),

    Food(
      "Vanilla Ice Cream", 
      "Creamy vanilla ice cream, smooth and sweet",
      "images/desserts/vanilla_ice_cream.png", 
      30.00, 
      FoodCategory.desserts, 
      [
        Addon(name: "berries", Price: 0.99),
        Addon(name: "syrup", Price: 1.99),
        Addon(name: "honey", Price: 2.99)
      ]
    ),


    // salads
    Food(
      "Caesar Salad", 
      "Romaine lettuce, grilled chicken, croutons, parmesan, Caesar dressing",
      "images/salad/caesar_salad.png", 
      30.00, 
      FoodCategory.salads, 
      [
        Addon(name: "salad cream", Price: 0.99),
        Addon(name: "ketchup", Price: 1.99),
        Addon(name: "mustard", Price: 2.99)
      ]
    ),

    Food(
      "Greek Salad", 
      "Tomatoes, cucumber, red onion, olives, feta cheese, olive oil dressing.",
      "images/salad/greek_salad.png", 
      36.00, 
      FoodCategory.salads, 
      [
        Addon(name: "salad cream", Price: 0.99),
        Addon(name: "ketchup", Price: 1.99),
        Addon(name: "mustard", Price: 2.99)
      ]
    ),

    Food(
      "Cobb Salad", 
      "Grilled chicken, avocado, bacon, egg, tomatoes, blue cheese",
      "images/salad/cobbsalad.png", 
      46.00, 
      FoodCategory.salads, 
      [
        Addon(name: "salad cream", Price: 0.99),
        Addon(name: "ketchup", Price: 1.99),
        Addon(name: "mustard", Price: 2.99)
      ]
    ),

    Food(
      "Garden Salad", 
      "Mixed greens, carrots, cucumber, tomatoes, vinaigrette.",
      "images/salad/garden_salad.png", 
      26.00, 
      FoodCategory.salads, 
      [
        Addon(name: "salad cream", Price: 0.99),
        Addon(name: "ketchup", Price: 1.99),
        Addon(name: "mustard", Price: 2.99)
      ]
    ),

    Food(
      "Pasta Salad", 
      "Rotini pasta, cherry tomatoes, olives, bell peppers, Italian dressing.",
      "images/salad/pasta_salad.png", 
      34.00, 
      FoodCategory.salads, 
      [
        Addon(name: "salad cream", Price: 0.99),
        Addon(name: "ketchup", Price: 1.99),
        Addon(name: "mustard", Price: 2.99)
      ]
    ),
    

    // drinks
    Food(
      "Fresh Orange Juice", 
      "Freshly squeezed oranges, naturally sweet and refreshing",
      "images/drinks/orange juice.png", 
      41.00, 
      FoodCategory.drinks, 
      [
        Addon(name: "orange", Price: 0.99),
        Addon(name: "sweetener", Price: 0.99),
      ]
    ),

    Food(
      "Lemonade", 
      "Cool, tangy lemon drink with a touch of sweetness",
      "images/drinks/lemonade.png", 
      37.00, 
      FoodCategory.drinks, 
      [
        Addon(name: "lemon", Price: 3.99),
        Addon(name: "sweetener", Price: 0.99),
      ]
    ),

    Food(
      "Iced Tea", 
      "Chilled brewed tea, lightly sweetened and refreshing",
      "images/drinks/iced_tea.png", 
      33.00, 
      FoodCategory.drinks, 
      [
        Addon(name: "sugar", Price: 3.99),
      ]
    ),

    Food(
      "Mango Smoothie", 
      "Blended ripe mangoes, creamy, thick, and tropical",
      "images/drinks/mango_smoothie.png", 
      34.00, 
      FoodCategory.drinks, 
      [
        Addon(name: "Mango slices", Price: 3.56),
      ]
    ),


    // sides
    Food(
      "French Fries", 
      "Golden crispy fries, lightly salted and crunchy",
      "images/sides/french_fries.png", 
      24.60, 
      FoodCategory.sides, 
      [
        Addon(name: "Ketchup", Price: 1.56),
        Addon(name: "Mustard", Price: 3.00),
      ]
    ),

    Food(
      "Onion Rings", 
      "Crispy battered onions, golden and flavorful",
      "images/sides/onion_rings.png", 
      34.60, 
      FoodCategory.sides, 
      [
        Addon(name: "Ketchup", Price: 1.56),
        Addon(name: "Mustard", Price: 3.00),
      ]
    ),    

    Food(
      "Garlic Bread", 
      "Toasted bread with garlic butter and herbs",
      "images/sides/garlic_bread.png", 
      40.00, 
      FoodCategory.sides, 
      [
        Addon(name: "pepper", Price: 1.56),
        Addon(name: "Mustard", Price: 3.00),
      ]
    ), 

    Food(
      "Coleslaw", 
      "Fresh shredded cabbage with creamy dressing.",
      "images/sides/coleslaw.png", 
      40.00, 
      FoodCategory.sides, 
      [
        Addon(name: "salad cream", Price: 1.56),
        Addon(name: "Mustard", Price: 3.00),
      ]
    ), 
  ];

  String _deliveryAddress = "V.G.C Road 12";


  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  final List<CartItem> _cart = [];
  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if(cartItem != null){
      cartItem.quantity++;
    }else{
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex != -1) {
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
  }

  notifyListeners();
}

  double getTotalPrice(){
    double total = 0.0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.Price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int totalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    String formattedDate = DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());
     receipt.writeln(formattedDate);
     receipt.writeln();
     receipt.writeln("----------");
     for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("Add-ons: ${_formatAddon(cartItem.selectedAddons)}");
      }
      receipt.writeln();
      } 
      receipt.writeln("---------");
      receipt.writeln();
      receipt.writeln("Total Items: ${totalItemCount()}");
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
      receipt.writeln("Delivering to: " + deliveryAddress);

      return receipt.toString();
  }
  

  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddon(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.Price)})").join(",");
  }

}
