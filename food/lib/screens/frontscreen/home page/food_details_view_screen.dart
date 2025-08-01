import 'package:flutter/material.dart';
import 'package:food/widgets/buttons.dart';

class FoodDetailsViewScreen extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;
  final double num;
  final String description;
  final String ingredients;
  final int price;
  const FoodDetailsViewScreen(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle,
      required this.num,
      required this.description,
      required this.ingredients,
      required this.price});

  @override
  State<FoodDetailsViewScreen> createState() => _FoodDetailsViewScreenState();
}

class _FoodDetailsViewScreenState extends State<FoodDetailsViewScreen> {
  bool isliked = false;
  bool isclicked = false;
  int increment = 0;
  String selectedSize = '14"';
  final List<String> sizes = ['10"', '14"', '16"'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.asset(widget.img)),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontFamily: 'Sen',
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                            '${widget.num}',
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
                    height: 20,
                  ),
                  Text(
                    widget.description,
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: 'Sen', fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'SIZE:',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: sizes.map((size) {
                          final bool isSelected = selectedSize == size;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey.shade200,
                                ),
                                child: Center(
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'INGRIDENTS',
                    style: TextStyle(fontFamily: 'Sen', fontSize: 14),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                   widget.ingredients,
                    maxLines: 2,
                    style: TextStyle(
                        fontFamily: 'Sen', fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.price}',
                          style: TextStyle(fontSize: 28, fontFamily: 'Sen'),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                       if (increment > 0) increment--;
                                    });
                                  },
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                '$increment',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      increment = increment + 1;
                                    });
                                  },
                                  backgroundColor: Colors.grey,
                                  foregroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(child: Buttons(text: 'ADD TO CART', onTap: () {}))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
