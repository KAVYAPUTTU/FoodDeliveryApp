import 'package:flutter/material.dart';

class Itemscards extends StatelessWidget {
  final String img;
  final String title;
  final double num;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback? addtocart;
  const Itemscards(
      {super.key,
      required this.img,
      required this.title, required this.num, required this.subtitle, required this.onTap, this.addtocart});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sen'),
                ),
                Text(
                  subtitle,style: TextStyle(
                    fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sen',
                      color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$num',
                      style: TextStyle(
                          fontSize: 14, fontFamily: 'sen',),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: addtocart,
                        child: Icon(Icons.add)),
                    )
              ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
