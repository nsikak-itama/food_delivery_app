class Food{
  final String name;
  final String decsription;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddon;

  Food(this.name, this.decsription, this.imagePath, this.price, this.category, this.availableAddon);
}


enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks
}


class Addon{
  String name;
  double Price;

  Addon({
    required this.name, required this.Price
  });
}