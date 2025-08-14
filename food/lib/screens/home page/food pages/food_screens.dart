import 'package:flutter/material.dart';
import 'package:food/widgets/itemscards.dart';
import 'package:provider/provider.dart';
import '../restaurant pages/restaurant.dart';
import 'food_details_view_screen.dart';

class FoodScreens extends StatelessWidget {
  const FoodScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context);
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
                            value: restaurant.selectedValue,
                            items: ['Burger', 'Pizza', 'HotDog']
                                .map(buildMenuitem)
                                .toList(),
                            onChanged: (value) {
                              restaurant.changeCategory(value!);
                            },
                          ),
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
                  'Popular',
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
                  childAspectRatio: 0.9,
                  children: restaurant.filteredMenu.map((item) {
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
                SizedBox(
                  height: 20,
                ),
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
