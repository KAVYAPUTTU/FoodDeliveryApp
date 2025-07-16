import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/splashscreen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
        primary: Color(0xFFFF7622)
),
        useMaterial3: true,
      ),
      home: Splashscreen1()
    );
  }
}

