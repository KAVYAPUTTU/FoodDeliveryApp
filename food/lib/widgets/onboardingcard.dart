import 'package:flutter/material.dart';

class Onboardingcard extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;

  const Onboardingcard({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 100),
          SizedBox(
            height: 350,
            width: 400,
            child: Image.asset(img),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Sen',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Sen',
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
