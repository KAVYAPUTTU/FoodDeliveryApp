class FoodData {
  final String name;
  final String description;
  final String imagepath;
  final double price;
  final String restaurantname;
  final FoodCategory category;
  List<Addons> availableaddons;
  FoodData({
    required this.restaurantname,
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
    required this.availableaddons,
    required this.category,  
  });
}

enum FoodCategory{
  Burger,
  Pizza,
  Hotdog
}
class Addons{
   String name;
   double price;
   Addons({
    required this.name,
    required this.price
   });

}
