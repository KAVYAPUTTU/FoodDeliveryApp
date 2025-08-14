import 'package:flutter/material.dart';
import 'package:food/widgets/itemscards.dart';

import '../food pages/search_screen.dart';

class RestaurantScreenDetailsView extends StatefulWidget {
  final String img;
  final double rating;
  final String title;
  final String subtitle;
  const RestaurantScreenDetailsView(
      {super.key,
      required this.img,
      required this.rating,
      required this.title,
      required this.subtitle});

  @override
  State<RestaurantScreenDetailsView> createState() =>
      _RestaurantScreenDetailsViewState();
}

class _RestaurantScreenDetailsViewState
    extends State<RestaurantScreenDetailsView> {
  bool isliked = false;
  String selectedCategory = 'Burger';
  final Map<String, List<Map<String, dynamic>>> foodData = {
    'Burger': [
      {
        'img': 'assets/img/burger.png',
        'title': 'Burger Bistro',
        'subtitle': 'Rose Garden',
        'num': 4.0,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese',
        'price': 30
      },
      {
        'img': 'assets/img/burger2.png',
        'title': 'Smoking Burger',
        'subtitle': 'Cafenio',
        'num': 4.5,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese',
      },
      {
        'img': 'assets/img/burger3.png',
        'title': 'Smoking Burger',
        'subtitle': 'Cafenio',
        'num': 4.5,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese'
      }
    ],
    'Pizza': [
      {
        'img': 'assets/img/pizza.png',
        'title': 'Burger Bistro',
        'subtitle': 'Rose Garden',
        'num': 4.0,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese'
      },
      {
        'img': 'assets/img/pizza2.png',
        'title': 'Smokin Pizza',
        'subtitle': 'Cafenio roo',
        'num': 4.5,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese'
      },
      {
        'img': 'assets/img/pizza3.png',
        'title': 'Smokin Pizza',
        'subtitle': 'Cafenio roo',
        'num': 4.5,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese'
      },
      {
        'img': 'assets/img/pizza4.png',
        'title': 'Smokin Pizza',
        'subtitle': 'Cafenio roo',
        'num': 4.5,
        'price': 32,
        'description':
            'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
        'ingredients':
            'burger buns, beef or plant-based patty, lettuce, tomato, onion, pickles, and cheese'
      }
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.black,
              ),
              width: double.infinity,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Image.asset(
                              widget.img,
                              fit: BoxFit.fitHeight,
                            ))),
                  ),
                  Positioned(
                      top: 60,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.black,
                            child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.chevron_left,
                                )),
                          ),
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.black,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isliked = !isliked;
                                  });
                                },
                                icon: Icon(
                                    isliked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isliked ? Colors.red : Colors.black),
                                iconSize: 20,
                              )),
                        ],
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Theme.of(context).colorScheme.primary,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.rating}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/img/Delivery.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Free',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/img/Clock.png'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '20 min',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: 'Sen',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                        fontFamily: 'Sen', fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        RecentCard(
                          text: 'Burger',
                          onTap: () {
                            if (foodData.containsKey('Burger')) {
                              setState(() {
                                selectedCategory = 'Burger';
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("No data available for Burger")),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        RecentCard(
                          text: 'Pizza',
                          onTap: () {
                            if (foodData.containsKey('Pizza')) {
                              setState(() {
                                selectedCategory = 'Pizza';
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("No data available for Pizza")),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        RecentCard(
                          text: 'Sandwich',
                          onTap: () {
                            if (foodData.containsKey('Sandwich')) {
                              setState(() {
                                selectedCategory = 'Sandwich';
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("No data available for Sandwich")),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        RecentCard(
                          text: 'noodles',
                          onTap: () {
                            if (foodData.containsKey('Noodles')) {
                              // Handle the case when data exists
                              setState(() {
                                selectedCategory = 'Noodles';
                              });
                            } else {
                              // Show a message or do nothing
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("No data available for Noodles")),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    selectedCategory,
                    style: TextStyle(fontSize: 20, fontFamily: 'Sen'),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.9,
                    children: foodData[selectedCategory]!
                        .map((item) => Itemscards(
                              img: item['img'],
                              title: item['title'],
                              num: item['num'].toDouble(),
                              subtitle: item['subtitle'],
                              onTap: () {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
