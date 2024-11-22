import 'package:flutter/material.dart';
import 'package:practice/ui/screen/food_item_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodItemListScreen(),
    );
  }
}
