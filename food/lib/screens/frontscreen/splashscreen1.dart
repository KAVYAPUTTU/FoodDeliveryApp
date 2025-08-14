import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/onboardingscreen.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and then navigate
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>const Onboardingscreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Image.asset('assets/img/Logo.png')),
    );
  }
}