import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/cart%20pages/cart_screen_details.dart';
import 'package:food/screens/frontscreen/home%20page/food%20pages/food_screens.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.chevron_left)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(fontFamily: 'Sen', fontSize: 20),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        child: GestureDetector(
                         // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreenDetails())),
                          child: Icon(Icons.shopping_cart_outlined)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search dishes, restaurants',
                            hintStyle: TextStyle(
                                fontFamily: 'sen',
                                fontSize: 14,
                                color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(Icons.cancel, color: Colors.grey)),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Recent Keywords',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      RecentCard(
                        text: 'Burger',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodScreens()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RecentCard(
                        text: 'Sandwich',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodScreens()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RecentCard(
                        text: 'Pizza',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodScreens()));
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      RecentCard(
                        text: 'noodles',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodScreens()));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Suggested Restaurants',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SuggestedCards(
                    img: 'assets/img/resturant3.JPG',
                    title: 'pansi Restaurant',
                    rating: 4.2),
                SizedBox(
                  height: 8,
                ),
                SuggestedCards(
                    img: 'assets/img/resturant1.jpg',
                    title: 'pansi Restaurant',
                    rating: 4.2),
                SizedBox(
                  height: 8,
                ),
                SuggestedCards(
                    img: 'assets/img/resturant2.jpg',
                    title: 'pansi Restaurant',
                    rating: 4.2),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Popular Fast food',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PopularCards(
                        img: 'assets/img/pizza.png',
                        title: 'european Pizza',
                        subtitle: 'Uttora Coffe House'),
                    PopularCards(
                        img: 'assets/img/pizza.png',
                        title: 'european Pizza',
                        subtitle: 'Uttora Coffe House'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const RecentCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade200, width: 2),
          color: Colors.white,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 14, fontFamily: 'Sen'),
        )),
      ),
    );
  }
}

class SuggestedCards extends StatelessWidget {
  final String img;
  final String title;
  final double rating;
  const SuggestedCards(
      {super.key,
      required this.img,
      required this.title,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1))),
      child: Row(children: [
        Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontFamily: 'Sen'),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text('$rating',
                    style: TextStyle(fontSize: 14, fontFamily: 'Sen'))
              ],
            )
          ],
        )
      ]),
    );
  }
}

class PopularCards extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  const PopularCards(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 170,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // Optional background color
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                img,
                height: 100,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Sen',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Sen',
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
