import 'package:flutter/material.dart';

class Resturantcard extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final double rating;
  final String dileverycharge;
  final String time;
  final VoidCallback onTap;
  const Resturantcard({super.key, required this.img, required this.title, required this.subtitle, required this.rating, required this.dileverycharge, required this.time, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            img,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'sen',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontFamily: 'sen', fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
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
                              '$rating',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/img/Delivery.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              dileverycharge,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/img/Clock.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                  fontSize: 14),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
    );
  }
}