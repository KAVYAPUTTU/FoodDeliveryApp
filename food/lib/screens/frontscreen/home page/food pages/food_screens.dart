import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/home%20page/food%20pages/food_details_view_screen.dart';
import 'package:food/widgets/itemscards.dart';
import 'package:food/widgets/resturantcard.dart';

class FoodScreens extends StatefulWidget {
  const FoodScreens({super.key});

  @override
  State<FoodScreens> createState() => _FoodScreensState();
}

class _FoodScreensState extends State<FoodScreens> {
  final items = ['Burger', 'Pizza'];
  String selectedValue = 'Burger';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.chevron_left)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade200, width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              iconEnabledColor:
                                  Theme.of(context).colorScheme.primary,
                              value: selectedValue,
                              items: items.map(buildMenuitem).toList(),
                              onChanged: (String? value) => setState(
                                    () => selectedValue = value!,
                                  )),
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Popular burgers',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: (foodData[selectedValue] ?? [])
                      .map((item) => Itemscards(
                            img: item['img'],
                            title: item['title'],
                            num: item['num'].toDouble(),
                            subtitle: item['subtitle'],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FoodDetailsViewScreen(
                                            img: item['img'],
                                            title: item['title'],
                                            subtitle: item['subtitle'],
                                            num:
                                                (item['num'] as num).toDouble(),
                                            description: item['description'],
                                            ingredients: item['ingredients'],
                                            price: item['price'],
                                          )));
                            },
                          ))
                      .toList(),
                  //hardcoded values--->can be changed to dynamic
                  // Itemscards(
                  //   img: 'assets/img/burger.png',
                  //   title: 'Burger Bistro',
                  //   num: 40,
                  //   subtitle: 'Rose garden',
                  // ),
                  // Itemscards(
                  //   img: 'assets/img/burger.png',
                  //   title: 'Smokin Burger',
                  //   num: 40,
                  //   subtitle: 'Cafenio Restaurant',
                  // ),
                  // Itemscards(
                  //   img: 'assets/img/burger.png',
                  //   title: 'Buffalo Burgers',
                  //   num: 40,
                  //   subtitle: 'Kaji Firm Kitchen',
                  // ),
                  // Itemscards(
                  //   img: 'assets/img/burger.png',
                  //   title: 'Buffalo Burgers',
                  //   num: 40,
                  //   subtitle: 'Kaji Firm Kitchen',
                  // )
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Open Resturants',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
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
                    time: '30 min'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuitem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Sen',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
