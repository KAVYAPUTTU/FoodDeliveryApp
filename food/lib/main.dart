import 'package:flutter/material.dart';
import 'package:food/screens/frontscreen/splashscreen1.dart';
import 'package:provider/provider.dart';
import 'screens/frontscreen/home page/restaurant pages/restaurant.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Restaurant(),
      child: const MyApp(),
    ),
  );
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

