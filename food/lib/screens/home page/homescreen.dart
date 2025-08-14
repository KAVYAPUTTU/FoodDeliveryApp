import 'package:flutter/material.dart';
import 'package:food/screens/cart%20pages/cart_screen_details.dart';
import 'package:food/screens/home%20page/restaurant%20pages/restaurant.dart';
import 'package:food/widgets/food_data.dart';
import 'package:food/widgets/resturantcard.dart';

import 'food pages/search_screen.dart';

class Homescreen extends StatelessWidget {
  final Restaurant restaurant = Restaurant();
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodData> menuItems = restaurant.menu;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black,
                        child: Icon(Icons.menu),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DELIVER TO',
                            style: TextStyle(
                                fontFamily: 'sen',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Row(
                            children: [
                              Text(
                                'Halal Lab office',
                                style: TextStyle(
                                    fontFamily: 'sen',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreenDetails(
                                      cartItems: [],
                                    ))),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Hey Halal,",
                      style: TextStyle(
                          fontSize: 16, fontFamily: 'sen', color: Colors.grey)),
                  TextSpan(
                      text: " Good Afternoon!",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'sen',
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ])),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen())),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Search dishes, restaurants',
                            style: TextStyle(
                                fontFamily: 'sen',
                                fontSize: 14,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'All Categories',
                      style: TextStyle(
                        fontFamily: 'sen',
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(fontFamily: 'sen'),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoriesCard(
                        title: 'All',
                        img: 'assets/img/fire.png',
                        onTap: () {
                          
                        },
                      ),
                      CategoriesCard(
                        title: 'Hot Dog',
                        img: 'assets/img/hot_dog.png',
                        onTap: () {},
                      ),
                      CategoriesCard(
                        title: 'Burger',
                        img: 'assets/img/burger.png',
                        onTap: () {},
                      ),
                      CategoriesCard(
                        title: 'Pizza',
                        img: 'assets/img/pizza.png',
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Open Restaurants',
                      style: TextStyle(
                        fontFamily: 'sen',
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(fontFamily: 'sen'),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Resturantcard(
                  img: 'assets/img/resturant3.JPG',
                  title: 'rose garden restaurant',
                  subtitle: 'Burger - Chiken - Riche - Wings',
                  rating: 4.7,
                  dileverycharge: 'Free',
                  time: '30 min',
                  onTap: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                Resturantcard(
                  img: 'assets/img/resturant2.jpg',
                  title: 'rose garden restaurant',
                  subtitle: 'Burger - Chiken - Riche - Wings',
                  rating: 4.7,
                  dileverycharge: 'Free',
                  time: '30 min',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//categories card
class CategoriesCard extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback onTap;
  const CategoriesCard(
      {super.key, required this.title, required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        width: 150,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.shade100,
                ),
                child: Image.asset(img),
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'sen',
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BigCategoryCard extends StatelessWidget {
  final String img;
  final String title;
  final String startprice;
  const BigCategoryCard(
      {super.key,
      required this.img,
      required this.title,
      required this.startprice});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(height: 80, width: 80, child: Image.asset(img)),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'sen'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Starting',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'sen', color: Colors.grey),
                  ),
                  Text(
                    startprice,
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'sen', color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

