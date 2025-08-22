import 'package:flutter/material.dart';
import 'package:food/widgets/food_data.dart';

class Restaurant extends ChangeNotifier{
  String selectedValue='Burger';
  final List<FoodData> _menu = [
    // Burgers
    FoodData(
      name: 'Burger Bistro',
      description:
          'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. ingredients',
      imagepath: 'assets/img/burger/burger.png',
      price: 30,
      availableaddons: [Addons(name: 'Cheese', price: 30)],
      restaurantname: 'Burger Bistro House', category: FoodCategory.Burger,
    ),
    FoodData(
      name: 'Burger Bistro',
      description:
          'Juicy grilled beef patty with melted cheese, fresh lettuce, tomatoes, and our signature sauce.',
      imagepath: 'assets/img/burger/burger2.png',
      price: 30,
      availableaddons: [
        Addons(name: 'Cheese', price: 5),
        Addons(name: 'Bacon', price: 8),
      ],
      restaurantname: 'Burger Bistro House', category: FoodCategory.Burger,
    ),
    FoodData(
      name: 'Classic Beef Burger',
      description:
          'A timeless classic with a thick beef patty, lettuce, tomato, onions, and special sauce.',
      imagepath: 'assets/img/burger/burger3.png',
      price: 28,
      availableaddons: [
        Addons(name: 'Double Patty', price: 12),
        Addons(name: 'Extra Cheese', price: 5),
      ],
      restaurantname: 'Grill Masters', category: FoodCategory.Burger,
    ),
    FoodData(
      name: 'Spicy Jalapeño Burger',
      description:
          'Beef patty topped with melted cheese, fresh jalapeños, spicy mayo, and crispy onions.',
      imagepath: 'assets/img/burger/burger4.png',
      price: 32,
      availableaddons: [
        Addons(name: 'Extra Jalapeños', price: 4),
        Addons(name: 'Pepper Jack Cheese', price: 6),
      ],
      restaurantname: 'Spice & Grill', category: FoodCategory.Burger,
    ),
    FoodData(
      name: 'BBQ Bacon Burger',
      description:
          'Smoky BBQ sauce, crispy bacon, cheddar cheese, and a grilled beef patty in a toasted bun.',
      imagepath: 'assets/img/burger/burger5.png',
      price: 35,
      availableaddons: [
        Addons(name: 'Extra Bacon', price: 7),
        Addons(name: 'Onion Rings', price: 5),
      ],
      
      restaurantname: 'BBQ Haven', category: FoodCategory.Burger,
    ),

    // Pizza
    FoodData(
      name: 'Pepperoni Pizza',
      description:
          'Hand-tossed crust topped with rich tomato sauce, mozzarella cheese, and spicy pepperoni slices.',
      imagepath: 'assets/img/pizza/pizza.png',
      price: 45,
      availableaddons: [
        Addons(name: 'Extra Cheese', price: 6),
        Addons(name: 'Olives', price: 4),
      ],
      restaurantname: 'Italiano Pizzeria', category: FoodCategory.Pizza,
    ),
    FoodData(
      name: 'Margherita Pizza',
      description:
          'A classic Italian favorite with fresh mozzarella, tomatoes, and fragrant basil leaves.',
      imagepath: 'assets/img/pizza/pizza2.png',
      price: 40,
      availableaddons: [
        Addons(name: 'Extra Basil', price: 3),
        Addons(name: 'Garlic Drizzle', price: 4),
      ],
      restaurantname: 'Roma Kitchen', category: FoodCategory.Pizza,
    ),
    FoodData(
      name: 'BBQ Chicken Pizza',
      description:
          'Grilled chicken, smoky BBQ sauce, red onions, and mozzarella cheese on a crispy base.',
      imagepath: 'assets/img/pizza/pizza3.png',
      price: 48,
      availableaddons: [
        Addons(name: 'Extra BBQ Sauce', price: 3),
        Addons(name: 'Jalapeños', price: 5),
      ],
      restaurantname: 'BBQ Haven', category: FoodCategory.Pizza,
    ),
    FoodData(
      name: 'Veggie Supreme Pizza',
      description:
          'Loaded with bell peppers, olives, mushrooms, onions, and mozzarella cheese.',
      imagepath: 'assets/img/pizza/pizza4.png',
      price: 42,
      availableaddons: [
        Addons(name: 'Sweet Corn', price: 4),
        Addons(name: 'Extra Olives', price: 5),
      ],
      restaurantname: 'Veggie Delight', category: FoodCategory.Pizza,
    ),
    FoodData(
      name: 'Four Cheese Pizza',
      description:
          'A rich blend of mozzarella, cheddar, parmesan, and blue cheese for cheese lovers.',
      imagepath: 'assets/img/pizza/pizza5.png',
      price: 50,
      availableaddons: [
        Addons(name: 'Extra Blue Cheese', price: 7),
        Addons(name: 'Garlic Butter Crust', price: 5),
      ],
      restaurantname: 'Cheese Lovers Hub', category: FoodCategory.Pizza,
    ),

    // Hotdogs
    FoodData(
      name: 'Classic Hot Dog',
      description:
          'Grilled sausage in a fresh bun with ketchup, mustard, and onions.',
      imagepath: 'assets/img/hotdog/hot_dog.png',
      price: 25,
      availableaddons: [
        Addons(name: 'Extra Sausage', price: 8),
        Addons(name: 'Cheese Sauce', price: 5),
      ],
      restaurantname: 'Hotdog Express', category:FoodCategory.Hotdog,
    ),
    FoodData(
      name: 'Chili Cheese Hot Dog',
      description:
          'Topped with spicy chili, melted cheddar, and chopped onions.',
      imagepath: 'assets/img/hotdog/hotdog2.png',
      price: 30,
      availableaddons: [
        Addons(name: 'Extra Chili', price: 6),
        Addons(name: 'Jalapeños', price: 4),
      ],
      restaurantname: 'Spice & Grill', category:FoodCategory.Hotdog,
    ),
    FoodData(
      name: 'Bacon Wrapped Hot Dog',
      description:
          'Juicy sausage wrapped in crispy bacon with BBQ sauce and fried onions.',
      imagepath: 'assets/img/hotdog/hotdog3.png',
      price: 32,
      availableaddons: [
        Addons(name: 'Extra Bacon', price: 7),
        Addons(name: 'Cheddar Cheese', price: 5),
      ],
      restaurantname: 'BBQ Haven', category:FoodCategory.Hotdog,
    ),
    FoodData(
      name: 'Veggie Hot Dog',
      description:
          'Grilled plant-based sausage in a whole wheat bun with lettuce, tomato, and vegan mayo.',
      imagepath: 'assets/img/hotdog/hotdog4.png',
      price: 28,
      availableaddons: [
        Addons(name: 'Avocado', price: 6),
        Addons(name: 'Vegan Cheese', price: 5),
      ],
      restaurantname: 'Veggie Delight', category:FoodCategory.Hotdog,
    ),
    FoodData(
      name: 'Spicy Jalapeño Hot Dog',
      description:
          'Loaded with pickled jalapeños, spicy mayo, and pepper jack cheese.',
      imagepath: 'assets/img/hotdog/hotdog5.png',
      price: 30,
      availableaddons: [
        Addons(name: 'Extra Jalapeños', price: 4),
        Addons(name: 'Hot Sauce Drizzle', price: 3),
      ],
      restaurantname: 'Spice & Grill', category:FoodCategory.Hotdog,
    ),
  ];

final List<RestaurantData> restaurants = [
  RestaurantData(
    name: 'Burger Bistro House',
    location: 'Downtown, City Center',
    rating: 4.6,
    image: 'assets/img/restaurants/resturant1.jpg',
    cuisineType: 'Burgers & Fast Food', menu: [],
  ),
  RestaurantData(
    name: 'Grill Masters',
    location: 'Main Street 45',
    rating: 4.4,
    image: 'assets/img/restaurants/resturant2.jpg',
    cuisineType: 'Burgers & BBQ', menu: [],
  ),
  RestaurantData(
    name: 'Spice & Grill',
    location: 'Spice Avenue 12',
    rating: 4.5,
    image: 'assets/img/restaurants/resturant3.jpg',
    cuisineType: 'Spicy Burgers & Hotdogs', menu: [],
  ),
  RestaurantData(
    name: 'BBQ Haven',
    location: 'Riverside Road',
    rating: 4.7,
    image:'assets/img/restaurants/resturant4.jpg' ,
    cuisineType: 'BBQ & Grilled Food', menu: [],
  ),
  RestaurantData(
    name: 'Italiano Pizzeria',
    location: 'Pasta Street 8',
    rating: 4.8,
    image: 'assets/img/restaurants/resturant5.jpg',
    cuisineType: 'Italian Pizza', menu: [],
  ),
  RestaurantData(
    name: 'Roma Kitchen',
    location: 'Old Town Plaza',
    rating: 4.6,
    image:'assets/img/restaurants/resturant6.jpg',
    cuisineType: 'Italian Cuisine', menu: [],
  ),
  RestaurantData(
    name: 'Veggie Delight',
    location: 'Green Lane 22',
    rating: 4.5,
    image: 'assets/img/restaurants/resturant7.jpg',
    cuisineType: 'Vegetarian & Vegan', menu: [],
  ),
  // RestaurantData(
  //   name: 'Cheese Lovers Hub',
  //   location: 'Cheddar Street 14',
  //   rating: 4.9,
  //   image: 'assets/img/restaurants/cheese_lovers.png',
  //   cuisineType: 'Cheese-based Dishes', menu: [],
  // ),
  // RestaurantData(
  //   name: 'Hotdog Express',
  //   location: 'Station Road',
  //   rating: 4.3,
  //   image: 'assets/img/restaurants/hotdog_express.png',
  //   cuisineType: 'Hotdogs & Fast Food', menu: [],
  // ),
];

//change the category
void changeCategory(String value) {
    selectedValue = value;
    notifyListeners();
  }
//getters
List<FoodData> get menu => _menu;
List<FoodData> get filteredMenu {
    return _menu.where((item) {
      return item.category.name.toLowerCase() ==
          selectedValue.toLowerCase();
    }).toList();
  }
}
