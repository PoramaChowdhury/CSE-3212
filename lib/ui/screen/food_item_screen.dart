import 'package:flutter/material.dart';
import 'package:practice/ui/model/item.dart';
import 'package:practice/ui/widget/food_item.dart';

class FoodItemListScreen extends StatefulWidget {
  @override
  _FoodItemListScreenState createState() => _FoodItemListScreenState();
}

class _FoodItemListScreenState extends State<FoodItemListScreen> {
  final List<FoodItem> foodItems = [
    FoodItem(
      title: 'Ovenbake Pasta',
      price: '250',
      description: 'Pasta',
      imageUrl: 'asset/image/bakedpasta.jpg',
    ),
    FoodItem(
      title: 'Chicken Fry',
      price: '180',
      description: 'Crispy chicken fry',
      imageUrl: 'asset/image/chickenfry.jpg',
    ),
    FoodItem(
      title: 'Garlic Chicken',
      price: '220',
      description: 'Garlic-flavored chicken',
      imageUrl: 'asset/image/garlicChicken.jpg',
    ),
    FoodItem(
      title: 'Kabab',
      price: '300',
      description: 'Spicy grilled kabab',
      imageUrl: 'asset/image/kabab.jpg',
    ),
    FoodItem(
      title: 'Pasta',
      price: '150',
      description: 'Classic pasta',
      imageUrl: 'asset/image/pasta.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Items',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.lightBlueAccent],
            ),
          ),
        ),
        elevation: 9,
        centerTitle: true,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return FoodItemCard(foodItem: foodItems[index]);
          },
        ),
      ),
    );
  }
}
