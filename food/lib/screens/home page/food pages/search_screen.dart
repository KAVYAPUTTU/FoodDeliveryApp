import 'package:flutter/material.dart';
import 'package:food/widgets/food_data.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../../widgets/itemscards.dart';
import '../../cart pages/cart_item.dart';
import '../restaurant pages/restaurant.dart';
import 'food_details_view_screen.dart';
import 'food_screens.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CartItem> cartItems = [];
  final random = Random();

  @override
  Widget build(BuildContext context) {
    //provider
    final restaurant = Provider.of<Restaurant>(context);
    //shuffle menu
    final List<FoodData> jumbledMenu = List.from(restaurant.menu)
      ..shuffle(random);
    //selecting on three
    final List<FoodData> visibleItems = jumbledMenu.take(3).toList();
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
                        child: IconButton(
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: MySearchDelegate(
                                    Provider.of<Restaurant>(context,listen: false).menu
                                  ));
                            },
                            icon: Icon(Icons.search)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Foods',
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
                          Provider.of<Restaurant>(context,listen: false).changeCategory('Burger');
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
                        text: 'Hotdog',
                        onTap: () {
                          Provider.of<Restaurant>(context,listen: false).changeCategory('HotDog');
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
                          Provider.of<Restaurant>(context,listen: false).changeCategory('Pizza');
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
                  'Ratings',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Sen',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: visibleItems.length,
                    itemBuilder: (context, index) {
                      final food = visibleItems[index];
                      return SuggestedCards(
                          img: food.imagepath, title: food.name, rating: 4.5);
                    }),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Show More',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Sen',
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.refresh,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary)
                    ],
                  ),
                ),
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
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.9,
                  children: visibleItems.map((item) {
                    return Itemscards(
                        img: item.imagepath,
                        title: item.name,
                        num: item.price.toDouble(),
                        subtitle: item.restaurantname,
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => FoodDetailsViewScreen(
                                        img: item.imagepath,
                                        title: item.name,
                                        subtitle: item.restaurantname,
                                        num: item.price.toDouble(),
                                        description: item.description,
                                        ingredients: item.availableaddons
                                            .map((e) => e.name)
                                            .join(','),
                                      )));
                        });
                  }).toList(),
                ),
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
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
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

class MySearchDelegate extends SearchDelegate {
  final List<FoodData> foods;
  // it is hardcoded values i used my provider Restaurant here
  // final List<String> foods = [
  //   'Burger',
  //   'Pizza',
  //   'Hotdog',
  // ];
  MySearchDelegate(this.foods);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon:Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context) {
    List<FoodData> matchquery =[];
    for(var food in foods){
      if(food.name.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(food);
      }
    }
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context,index){
        var result = matchquery[index];
        return ListTile(
          leading: Image.asset(result.imagepath,width: 50,height: 50,fit: BoxFit.contain,),
          title: Text(result.name),
          subtitle: Text(result.restaurantname),
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodDetailsViewScreen(img: result.imagepath, title:result.name, subtitle:result.restaurantname, num:result.price, description:result.description, ingredients:result.availableaddons.toString())));
          },
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(
        child: Text('Start Typing to Search'),
      );
    }
    List<FoodData> matchQuery = [];
    for (var food in foods) {
      if (food.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(food);
      }
    }
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index){
        var suggestion = matchQuery[index];
         return ListTile(
          leading: Image.asset(suggestion.imagepath,width: 40,height: 40,fit: BoxFit.cover,),
          title: Text(suggestion.name),
          subtitle: Text(suggestion.restaurantname),
          onTap: () {
            query= suggestion.name;
            showResults(context);
          },
          );
      }
      ),
    );

  }
}